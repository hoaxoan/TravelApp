'use strict';

/**
 * Photos.js service
 *
 * @description: A set of functions similar to controller's actions to avoid code duplication.
 */

// Public dependencies.
const _ = require('lodash');

// Strapi utilities.
const utils = require('strapi-bookshelf/lib/utils/');

module.exports = {

  /**
   * Promise to fetch all photos.
   *
   * @return {Promise}
   */

  fetchAll: (params) => {
    const convertedParams = strapi.services.searchs.convertSearchParams('photos', params);

    return Photos.query(function(qb) {
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
      withRelated: _.keys(_.groupBy(_.reject(strapi.models.photos.associations, {autoPopulate: false}), 'alias'))
    });
  },

  /**
   * Promise to fetch a/an photos.
   *
   * @return {Promise}
   */

  fetch: (params) => {
    return Photos.forge(_.pick(params, 'id')).fetch({
      withRelated: _.keys(_.groupBy(_.reject(strapi.models.photos.associations, {autoPopulate: false}), 'alias'))
    });
  },

  /**
   * Promise to add a/an photos.
   *
   * @return {Promise}
   */

  add: async (values) => {
    const data = await Photos.forge(_.omit(values, _.keys(_.groupBy(strapi.models.photos.associations, 'alias')))).save();
    await strapi.hook.bookshelf.manageRelations('photos', _.merge(_.clone(data.toJSON()), { values }));
    return data;
  },

  /**
   * Promise to edit a/an photos.
   *
   * @return {Promise}
   */

  edit: async (params, values) => {
    await strapi.hook.bookshelf.manageRelations('photos', _.merge(_.clone(params), { values }));
    return Photos.forge(params).save(_.omit(values, _.keys(_.groupBy(strapi.models.photos.associations, 'alias'))), {path: true});
  },

  /**
   * Promise to remove a/an photos.
   *
   * @return {Promise}
   */

  remove: (params) => {
    _.forEach(Photos.associations, async association => {
      await Photos.forge(params)[association.alias]().detach();
    });
    return Photos.forge(params).destroy();
  }
};
