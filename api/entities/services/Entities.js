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
        _.forEach(where, async wh => {
          qb.where(key, wh.symbol, wh.value);
        });
      });

      if (convertedParams.sort) {
        qb.orderBy(convertedParams.sort);
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

  fetch: async (params) => {
    // Photos
    const photos = [];
    const data = await strapi.services.photos.fetchAll({'related_id': _.pick(params, 'id').id});
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
    const landmark = await Landmarks.forge({'entity_id': _.pick(params, 'id').id}).fetch({
      withRelated: _.keys(_.groupBy(_.reject(strapi.models.landmarks.associations, {autoPopulate: false}), 'alias'))
    });

    _.set(entity, 'attributes.landmark', landmark);
    
    // Hotel
    const hotel = await Hotels.forge({'entity_id': _.pick(params, 'id').id}).fetch({
      withRelated: _.keys(_.groupBy(_.reject(strapi.models.hotels.associations, {autoPopulate: false}), 'alias'))
    });
    
    _.set(entity, 'attributes.hotel', hotel);

    // Restaurant
    const restaurant = await Restaurants.forge({'entity_id': _.pick(params, 'id').id}).fetch({
      withRelated: _.keys(_.groupBy(_.reject(strapi.models.restaurants.associations, {autoPopulate: false}), 'alias'))
    });

    _.set(entity, 'attributes.restaurant', restaurant);

    // Amenity
    const amenities = await strapi.services.amenities.fetchAll({'entity_id': _.pick(params, 'id').id});
    
    _.set(entity, 'attributes.amenities', amenities);
        
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
  }
};
