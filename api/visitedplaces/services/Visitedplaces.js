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

  fetchByUser: async (params) => {
    // Categories
    const user = 1;
    const visitedplaces = await strapi.services.visitedplaces.fetchAll({ 'user': user });
    const ids = [];

    _.forEach(visitedplaces.models, async visitedplace => {
      ids.push(visitedplace.attributes.related_id);
    });


    if (_.pick(params, 'related_type').related_type === 'landmarks') {
      return await strapi.services.landmarks.fetchAll({ 'ids': ids });
    } else if (_.pick(params, 'related_type').related_type === 'hotels') {
      return await strapi.services.hotels.fetchAll({ 'ids': ids });
    } else if (_.pick(params, 'related_type').related_type === 'restaurants') {
      return await strapi.services.restaurants.fetchAll({ 'ids': ids });
    } else {
      return await strapi.services.landmarks.fetchAll({ 'ids': ids });
    }
  }

};
