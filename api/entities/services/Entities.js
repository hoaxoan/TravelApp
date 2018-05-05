'use strict';

/**
 * Entities.js service
 *
 * @description: A set of functions similar to controller's actions to avoid code duplication.
 */

// Public dependencies.
const _ = require('lodash');

// Strapi utilities.
const utils = require('strapi-bookshelf/lib/utils/');

module.exports = {

  /**
   * Promise to fetch all entities.
   *
   * @return {Promise}
   */

  fetchAll: (params) => {
    const convertedParams = strapi.services.searchs.convertSearchParams('entities', params);

    return Entities.query(function(qb) {
      _.forEach(convertedParams.where, (where, key) => {
        if (_.isArray(where.value)) {
          for (const value in where.value) {
            qb[!where.orWhere ? 'where' : 'orWhere'](key, where.symbol, where.value[value])
          }
        } else {
          qb.where(key, where.symbol, where.value);
        }
      });

      if (convertedParams.sort) {
        qb.orderBy(convertedParams.sort.key, convertedParams.sort.order);
      }

      qb.offset(convertedParams.start);

      qb.limit(convertedParams.limit);
    }).fetchAll({
      withRelated: _.keys(_.groupBy(_.reject(strapi.models.entities.associations, {autoPopulate: false}), 'alias'))
    });
  },

  /**
   * Promise to fetch a/an entities.
   *
   * @return {Promise}
   */

  fetch: async (ctx) => {
    const params = ctx.params;
    const id = _.pick(params, 'id').id;
    // Photos    
    const photos = [];
    const data = await strapi.services.photos.fetchAll({'related_id': id});
    _.forEach(data.models, async model => {
      const photo = await strapi.plugins['upload'].services.upload.fetch({'id': model.attributes.upload_file_id});
      photos.push(photo);
    });

    // Entity
    const entity = await Entities.forge(_.pick(params, 'id')).fetch({
      withRelated: _.keys(_.groupBy(_.reject(strapi.models.entities.associations, {autoPopulate: false}), 'alias'))
    });

    _.set(entity, 'attributes.photos', photos);

    // Landmark
    const landmark = await Landmarks.forge({'entity_id': id}).fetch({
      withRelated: _.keys(_.groupBy(_.reject(strapi.models.landmarks.associations, {autoPopulate: false}), 'alias'))
    });

    _.set(entity, 'attributes.landmark', landmark);
    
    // Hotel
    const hotel = await Hotels.forge({'entity_id': id}).fetch({
      withRelated: _.keys(_.groupBy(_.reject(strapi.models.hotels.associations, {autoPopulate: false}), 'alias'))
    });
    
    _.set(entity, 'attributes.hotel', hotel);

    // Restaurant
    const restaurant = await Restaurants.forge({'entity_id': id}).fetch({
      withRelated: _.keys(_.groupBy(_.reject(strapi.models.restaurants.associations, {autoPopulate: false}), 'alias'))
    });

    _.set(entity, 'attributes.restaurant', restaurant);

    // Amenity
    const amenities = await strapi.services.amenities.fetchAll({'entity_id': id});
    
    _.set(entity, 'attributes.amenities', amenities);
    
    if(ctx.state.user != null){
      // VisitedPlaces
      const visitedplace = await strapi.services.visitedplaces.fetchOneByUser({'related_id': id, "user_id": ctx.state.user.id});
      _.set(entity, 'attributes.visitedPlace', visitedplace);
      if(visitedplace != null){
        _.set(entity, 'attributes.watch', 1);
      } else {
        _.set(entity, 'attributes.watch', 0);
      }
    }
    return entity;
  },

  /**
   * Promise to add a/an entities.
   *
   * @return {Promise}
   */

  add: async (values) => {
    const data = await Entities.forge(_.omit(values, _.keys(_.groupBy(strapi.models.entities.associations, 'alias')))).save();
    await strapi.hook.bookshelf.manageRelations('entities', _.merge(_.clone(data.toJSON()), { values }));
    return data;
  },

  /**
   * Promise to edit a/an entities.
   *
   * @return {Promise}
   */

  edit: async (params, values) => {
    await strapi.hook.bookshelf.manageRelations('entities', _.merge(_.clone(params), { values }));
    return Entities.forge(params).save(_.omit(values, _.keys(_.groupBy(strapi.models.entities.associations, 'alias'))), {path: true});
  },

  /**
   * Promise to remove a/an entities.
   *
   * @return {Promise}
   */

  remove: (params) => {
    _.forEach(Entities.associations, async association => {
      await Entities.forge(params)[association.alias]().detach();
    });
    return Entities.forge(params).destroy();
  },

  /**
  * Promise to fetch all entities.
  *
  * @return {Promise}
  */

 fetchAllWith: async (ctx) => {
    var params = ctx.query;
  
    var mood_id = '0';
    if(_.pick(params, 'mood_id') != null){
      mood_id = _.pick(params, 'mood_id').mood_id;
    } 

    if(mood_id != null && mood_id != '0'){
      var trip_id = '0';
      if(_.pick(params, 'trip_id') != null){
        trip_id = _.pick(params, 'trip_id').trip_id;
      }

      var type = '0';
      if(_.pick(params, 'type') != null){
        type = _.pick(params, 'type').type;
      }

      const ids = [];
      const moods = await strapi.services.entitiesmoods.fetchAll({'trip_id': trip_id, 'type': type, 'mood_id': mood_id});
      _.forEach(moods.models, async model => {
        ids.push(model.attributes.entity_id);
      });

      if(ids.length <= 0){
        return moods;
      }

      if(params != null) {
        params.trip_id = '0';
        params.type = '0';
        params.mood_id = '0';
        params.ids = ids;
      }
      
    }
    
    const data = await strapi.services.entities.fetchAll(params);

    // Execute entities function of the watch for all entities.
    return Promise.all(
      data.map(async entity => {
        if(ctx.state.user != null){
          // VisitedPlaces
          const visitedplace = await strapi.services.visitedplaces.fetchOneByUser({'related_id': entity.id, "user_id": ctx.state.user.id});
          _.set(entity, 'attributes.visitedPlace', visitedplace);
          if(visitedplace != null){
            _.set(entity, 'attributes.watch', 1);
          } else {
            _.set(entity, 'attributes.watch', 0);
          }
        }
        return entity;
      })
    );
 }

};
