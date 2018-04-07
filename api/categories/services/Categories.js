'use strict';

/**
 * Categories.js service
 *
 * @description: A set of functions similar to controller's actions to avoid code duplication.
 */

// Public dependencies.
const _ = require('lodash');

// Strapi utilities.
const utils = require('strapi-bookshelf/lib/utils/');

module.exports = {

  /**
   * Promise to fetch all categories.
   *
   * @return {Promise}
   */

  fetchAll: (params) => {
    const convertedParams = strapi.utils.models.convertParams('categories', params);

    return Categories.query(function(qb) {
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
      withRelated: _.keys(_.groupBy(_.reject(strapi.models.categories.associations, {autoPopulate: false}), 'alias'))
    });
  },

  /**
   * Promise to fetch a/an categories.
   *
   * @return {Promise}
   */

  fetch: (params) => {
    return Categories.forge(_.pick(params, 'id')).fetch({
      withRelated: _.keys(_.groupBy(_.reject(strapi.models.categories.associations, {autoPopulate: false}), 'alias'))
    });
  },

  /**
   * Promise to add a/an categories.
   *
   * @return {Promise}
   */

  add: async (values) => {
    const data = await Categories.forge(_.omit(values, _.keys(_.groupBy(strapi.models.categories.associations, 'alias')))).save();
    await strapi.hook.bookshelf.manageRelations('categories', _.merge(_.clone(data.toJSON()), { values }));
    return data;
  },

  /**
   * Promise to edit a/an categories.
   *
   * @return {Promise}
   */

  edit: async (params, values) => {
    await strapi.hook.bookshelf.manageRelations('categories', _.merge(_.clone(params), { values }));
    return Categories.forge(params).save(_.omit(values, _.keys(_.groupBy(strapi.models.categories.associations, 'alias'))), {path: true});
  },

  /**
   * Promise to remove a/an categories.
   *
   * @return {Promise}
   */

  remove: (params) => {
    _.forEach(Categories.associations, async association => {
      await Categories.forge(params)[association.alias]().detach();
    });
    return Categories.forge(params).destroy();
  },

  /**
   * Promise to fetch all categories.
   *
   * @return {Promise}
   */

  fetchByTypes: async (params) => {
    // Categories
    const categories = await strapi.services.categories.fetchAll({'type': params});
    // _.forEach(categories.models, async category => {
    //   const restaurants = strapi.services.categories.fetchByRestaurants(category.id);
    //   _.set(category, 'attributes.restaurants', restaurants);
    // });
    return categories;

  },

  fetchByRestaurants: async (categoryId) => {
    return await strapi.services.restaurants.fetchAll({'category_id': categoryId});
  }

};
