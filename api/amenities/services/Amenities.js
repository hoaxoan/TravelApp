'use strict';

/**
 * Amenities.js service
 *
 * @description: A set of functions similar to controller's actions to avoid code duplication.
 */

// Public dependencies.
const _ = require('lodash');

// Strapi utilities.
const utils = require('strapi-bookshelf/lib/utils/');

module.exports = {

  /**
   * Promise to fetch all amenities.
   *
   * @return {Promise}
   */

  fetchAll: (params) => {
    const convertedParams = strapi.services.searchs.convertSearchParams('amenities', params);

    return Amenities.query(function(qb) {
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
      withRelated: _.keys(_.groupBy(_.reject(strapi.models.amenities.associations, {autoPopulate: false}), 'alias'))
    });
  },

  /**
   * Promise to fetch a/an amenities.
   *
   * @return {Promise}
   */

  fetch: (params) => {
    return Amenities.forge(_.pick(params, 'id')).fetch({
      withRelated: _.keys(_.groupBy(_.reject(strapi.models.amenities.associations, {autoPopulate: false}), 'alias'))
    });
  },

  /**
   * Promise to add a/an amenities.
   *
   * @return {Promise}
   */

  add: async (values) => {
    const data = await Amenities.forge(_.omit(values, _.keys(_.groupBy(strapi.models.amenities.associations, 'alias')))).save();
    await strapi.hook.bookshelf.manageRelations('amenities', _.merge(_.clone(data.toJSON()), { values }));
    return data;
  },

  /**
   * Promise to edit a/an amenities.
   *
   * @return {Promise}
   */

  edit: async (params, values) => {
    await strapi.hook.bookshelf.manageRelations('amenities', _.merge(_.clone(params), { values }));
    return Amenities.forge(params).save(_.omit(values, _.keys(_.groupBy(strapi.models.amenities.associations, 'alias'))), {path: true});
  },

  /**
   * Promise to remove a/an amenities.
   *
   * @return {Promise}
   */

  remove: (params) => {
    _.forEach(Amenities.associations, async association => {
      await Amenities.forge(params)[association.alias]().detach();
    });
    return Amenities.forge(params).destroy();
  }
};
