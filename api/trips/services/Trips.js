'use strict';

/**
 * Trips.js service
 *
 * @description: A set of functions similar to controller's actions to avoid code duplication.
 */

// Public dependencies.
const _ = require('lodash');

// Strapi utilities.
const utils = require('strapi-bookshelf/lib/utils/');

module.exports = {

  /**
   * Promise to fetch all trips.
   *
   * @return {Promise}
   */

  fetchAll: (params) => {
    const convertedParams = strapi.utils.models.convertParams('trips', params);

    return Trips.query(function(qb) {
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
      withRelated: _.keys(_.groupBy(_.reject(strapi.models.trips.associations, {autoPopulate: false}), 'alias'))
    });
  },

  /**
   * Promise to fetch a/an trips.
   *
   * @return {Promise}
   */

  fetch: async (params) => {
    // Categories
    const type = 1;
    const categories = await strapi.services.categories.fetchAll({'type': type});

    // Moods
    const moods = await strapi.services.moods.fetchAll();
  
    // Trip
    const trip = await Trips.forge(_.pick(params, 'id')).fetch({
      withRelated: _.keys(_.groupBy(_.reject(strapi.models.trips.associations, {autoPopulate: false}), 'alias'))
    });

    _.set(trip, 'attributes.categories', categories);

    _.set(trip, 'attributes.moods', moods);

    return trip;
  },

  /**
   * Promise to add a/an trips.
   *
   * @return {Promise}
   */

  add: async (values) => {
    const data = await Trips.forge(_.omit(values, _.keys(_.groupBy(strapi.models.trips.associations, 'alias')))).save();
    await strapi.hook.bookshelf.manageRelations('trips', _.merge(_.clone(data.toJSON()), { values }));
    return data;
  },

  /**
   * Promise to edit a/an trips.
   *
   * @return {Promise}
   */

  edit: async (params, values) => {
    await strapi.hook.bookshelf.manageRelations('trips', _.merge(_.clone(params), { values }));
    return Trips.forge(params).save(_.omit(values, _.keys(_.groupBy(strapi.models.trips.associations, 'alias'))), {path: true});
  },

  /**
   * Promise to remove a/an trips.
   *
   * @return {Promise}
   */

  remove: (params) => {
    _.forEach(Trips.associations, async association => {
      await Trips.forge(params)[association.alias]().detach();
    });
    return Trips.forge(params).destroy();
  }
};
