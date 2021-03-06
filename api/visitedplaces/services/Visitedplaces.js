'use strict';

/**
 * Visitedplaces.js service
 *
 * @description: A set of functions similar to controller's actions to avoid code duplication.
 */

// Public dependencies.
const _ = require('lodash');

// Strapi utilities.
const utils = require('strapi-bookshelf/lib/utils/');

module.exports = {

  /**
   * Promise to fetch all visitedplaces.
   *
   * @return {Promise}
   */

  fetchAll: (params) => {
    const convertedParams = strapi.services.searchs.convertSearchParams('visitedplaces', params);

    return Visitedplaces.query(function (qb) {
      _.forEach(convertedParams.where, (where, key) => {
        if (_.isArray(where.value)) {
          for (const value in where.value) {
            qb[value ? 'where' : 'orWhere'](key, where.symbol, where.value[value])
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
      withRelated: _.keys(_.groupBy(_.reject(strapi.models.visitedplaces.associations, { autoPopulate: false }), 'alias'))
    });
  },

  /**
   * Promise to fetch a/an visitedplaces.
   *
   * @return {Promise}
   */

  fetch: (params) => {
    return Visitedplaces.forge(_.pick(params, 'id')).fetch({
      withRelated: _.keys(_.groupBy(_.reject(strapi.models.visitedplaces.associations, { autoPopulate: false }), 'alias'))
    });
  },

  /**
   * Promise to add a/an visitedplaces.
   *
   * @return {Promise}
   */

  add: async (values) => {
    const data = await Visitedplaces.forge(_.omit(values, _.keys(_.groupBy(strapi.models.visitedplaces.associations, 'alias')))).save();
    await strapi.hook.bookshelf.manageRelations('visitedplaces', _.merge(_.clone(data.toJSON()), { values }));
    return data;
  },

  /**
   * Promise to edit a/an visitedplaces.
   *
   * @return {Promise}
   */

  edit: async (params, values) => {
    await strapi.hook.bookshelf.manageRelations('visitedplaces', _.merge(_.clone(params), { values }));
    return Visitedplaces.forge(params).save(_.omit(values, _.keys(_.groupBy(strapi.models.visitedplaces.associations, 'alias'))), { path: true });
  },

  /**
   * Promise to remove a/an visitedplaces.
   *
   * @return {Promise}
   */

  remove: (params) => {
    _.forEach(Visitedplaces.associations, async association => {
      await Visitedplaces.forge(params)[association.alias]().detach();
    });
    return Visitedplaces.forge(params).destroy();
  },

  /**
   * Promise to fetch a/an visisited places by user.
   *
   * @return {Promise}
   */

  fetchByUser: async (ctx) => {
    // VisitedPlaces
    const visitedplaces = await strapi.services.visitedplaces.fetchAll(ctx.query);
    if(visitedplaces.length <= 0){
      return visitedplaces;
    }

    const ids = [];

    _.forEach(visitedplaces.models, async visitedplace => {
      ids.push(visitedplace.attributes.related_id);
    });

    const data = await strapi.services.entities.fetchAll({ 'ids': ids });
      
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
    
  },
  /**
   * Promise to fetch a/an visisited places by user.
   *
   * @return {Promise}
   */

  fetchOneByUser: async (params) => {
    const data = await Visitedplaces.forge(params).fetch({
      withRelated: _.keys(_.groupBy(_.reject(strapi.models.visitedplaces.associations, {autoPopulate: false}), 'alias'))
    });
    return data;
    
  }

};
