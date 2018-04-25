'use strict';

/**
 * Restaurants.js service
 *
 * @description: A set of functions similar to controller's actions to avoid code duplication.
 */

// Public dependencies.
const _ = require('lodash');

// Strapi utilities.
const utils = require('strapi-bookshelf/lib/utils/');

module.exports = {

  /**
   * Promise to fetch all restaurants.
   *
   * @return {Promise}
   */

  fetchAll: (params) => {
    const convertedParams = strapi.services.searchs.convertSearchParams('restaurants', params);

    return Restaurants.query(function(qb) {
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
      withRelated: _.keys(_.groupBy(_.reject(strapi.models.restaurants.associations, {autoPopulate: false}), 'alias'))
    });
  },

  /**
   * Promise to fetch a/an restaurants.
   *
   * @return {Promise}
   */

  fetch: (params) => {
    
    return Restaurants.forge(_.pick(params, 'id')).fetch({
      withRelated: _.keys(_.groupBy(_.reject(strapi.models.restaurants.associations, {autoPopulate: false}), 'alias'))
    });

  },

  /**
   * Promise to add a/an restaurants.
   *
   * @return {Promise}
   */

  add: async (values) => {
    const data = await Restaurants.forge(_.omit(values, _.keys(_.groupBy(strapi.models.restaurants.associations, 'alias')))).save();
    await strapi.hook.bookshelf.manageRelations('restaurants', _.merge(_.clone(data.toJSON()), { values }));
    return data;
  },

  /**
   * Promise to edit a/an restaurants.
   *
   * @return {Promise}
   */

  edit: async (params, values) => {
    await strapi.hook.bookshelf.manageRelations('restaurants', _.merge(_.clone(params), { values }));
    return Restaurants.forge(params).save(_.omit(values, _.keys(_.groupBy(strapi.models.restaurants.associations, 'alias'))), {path: true});
  },

  /**
   * Promise to remove a/an restaurants.
   *
   * @return {Promise}
   */

  remove: (params) => {
    _.forEach(Restaurants.associations, async association => {
      await Restaurants.forge(params)[association.alias]().detach();
    });
    return Restaurants.forge(params).destroy();
  }
};
