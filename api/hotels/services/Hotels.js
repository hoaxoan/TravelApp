'use strict';

/**
 * Hotels.js service
 *
 * @description: A set of functions similar to controller's actions to avoid code duplication.
 */

// Public dependencies.
const _ = require('lodash');

// Strapi utilities.
const utils = require('strapi-bookshelf/lib/utils/');

module.exports = {

  /**
   * Promise to fetch all hotels.
   *
   * @return {Promise}
   */

  fetchAll: (params) => {
    const convertedParams = strapi.services.searchs.convertSearchParams('hotels', params);

    return Hotels.query(function(qb) {
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
      withRelated: _.keys(_.groupBy(_.reject(strapi.models.hotels.associations, {autoPopulate: false}), 'alias'))
    });
  },

  /**
   * Promise to fetch a/an hotels.
   *
   * @return {Promise}
   */

  fetch: (params) => {

    return Hotels.forge(_.pick(params, 'id')).fetch({
      withRelated: _.keys(_.groupBy(_.reject(strapi.models.hotels.associations, {autoPopulate: false}), 'alias'))
    });
    
  },

  /**
   * Promise to add a/an hotels.
   *
   * @return {Promise}
   */

  add: async (values) => {
    const data = await Hotels.forge(_.omit(values, _.keys(_.groupBy(strapi.models.hotels.associations, 'alias')))).save();
    await strapi.hook.bookshelf.manageRelations('hotels', _.merge(_.clone(data.toJSON()), { values }));
    return data;
  },

  /**
   * Promise to edit a/an hotels.
   *
   * @return {Promise}
   */

  edit: async (params, values) => {
    await strapi.hook.bookshelf.manageRelations('hotels', _.merge(_.clone(params), { values }));
    return Hotels.forge(params).save(_.omit(values, _.keys(_.groupBy(strapi.models.hotels.associations, 'alias'))), {path: true});
  },

  /**
   * Promise to remove a/an hotels.
   *
   * @return {Promise}
   */

  remove: (params) => {
    _.forEach(Hotels.associations, async association => {
      await Hotels.forge(params)[association.alias]().detach();
    });
    return Hotels.forge(params).destroy();
  }
};
