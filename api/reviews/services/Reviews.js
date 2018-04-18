'use strict';

/**
 * Reviews.js service
 *
 * @description: A set of functions similar to controller's actions to avoid code duplication.
 */

// Public dependencies.
const _ = require('lodash');

// Strapi utilities.
const utils = require('strapi-bookshelf/lib/utils/');

module.exports = {

  /**
   * Promise to fetch all reviews.
   *
   * @return {Promise}
   */

  fetchAll: (params) => {
    const convertedParams = strapi.services.searchs.convertSearchParams('reviews', params);

    return Reviews.query(function(qb) {
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
      withRelated: _.keys(_.groupBy(_.reject(strapi.models.reviews.associations, {autoPopulate: false}), 'alias'))
    });
  },

  /**
   * Promise to fetch a/an reviews.
   *
   * @return {Promise}
   */

  fetch: (params) => {
    return Reviews.forge(_.pick(params, 'id')).fetch({
      withRelated: _.keys(_.groupBy(_.reject(strapi.models.reviews.associations, {autoPopulate: false}), 'alias'))
    });
  },

  /**
   * Promise to add a/an reviews.
   *
   * @return {Promise}
   */

  add: async (values) => {
    const data = await Reviews.forge(_.omit(values, _.keys(_.groupBy(strapi.models.reviews.associations, 'alias')))).save();
    await strapi.hook.bookshelf.manageRelations('reviews', _.merge(_.clone(data.toJSON()), { values }));
    return data;
  },

  /**
   * Promise to edit a/an reviews.
   *
   * @return {Promise}
   */

  edit: async (params, values) => {
    await strapi.hook.bookshelf.manageRelations('reviews', _.merge(_.clone(params), { values }));
    return Reviews.forge(params).save(_.omit(values, _.keys(_.groupBy(strapi.models.reviews.associations, 'alias'))), {path: true});
  },

  /**
   * Promise to remove a/an reviews.
   *
   * @return {Promise}
   */

  remove: (params) => {
    _.forEach(Reviews.associations, async association => {
      await Reviews.forge(params)[association.alias]().detach();
    });
    return Reviews.forge(params).destroy();
  }
};
