'use strict';

/**
 * Landmarks.js service
 *
 * @description: A set of functions similar to controller's actions to avoid code duplication.
 */

// Public dependencies.
const _ = require('lodash');

// Strapi utilities.
const utils = require('strapi-bookshelf/lib/utils/');

module.exports = {

  /**
   * Promise to fetch all landmarks.
   *
   * @return {Promise}
   */

  fetchAll: (params) => {
    const convertedParams = strapi.services.searchs.convertSearchParams('landmarks', params);

    return Landmarks.query(function(qb) {
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
      withRelated: _.keys(_.groupBy(_.reject(strapi.models.landmarks.associations, {autoPopulate: false}), 'alias'))
    });
  },

  /**
   * Promise to fetch a/an landmarks.
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

    // Landmark
    const landmark = await Landmarks.forge(_.pick(params, 'id')).fetch({
      withRelated: _.keys(_.groupBy(_.reject(strapi.models.landmarks.associations, {autoPopulate: false}), 'alias'))
    });

    _.set(landmark, 'attributes.photos', photos);

    return landmark;
  },

  /**
   * Promise to add a/an landmarks.
   *
   * @return {Promise}
   */

  add: async (values) => {
    const data = await Landmarks.forge(_.omit(values, _.keys(_.groupBy(strapi.models.landmarks.associations, 'alias')))).save();
    await strapi.hook.bookshelf.manageRelations('landmarks', _.merge(_.clone(data.toJSON()), { values }));
    return data;
  },

  /**
   * Promise to edit a/an landmarks.
   *
   * @return {Promise}
   */

  edit: async (params, values) => {
    await strapi.hook.bookshelf.manageRelations('landmarks', _.merge(_.clone(params), { values }));
    return Landmarks.forge(params).save(_.omit(values, _.keys(_.groupBy(strapi.models.landmarks.associations, 'alias'))), {path: true});
  },

  /**
   * Promise to remove a/an landmarks.
   *
   * @return {Promise}
   */

  remove: (params) => {
    _.forEach(Landmarks.associations, async association => {
      await Landmarks.forge(params)[association.alias]().detach();
    });
    return Landmarks.forge(params).destroy();
  },

  /**
   * Promise to fetch all landmarks.
   *
   * @return {Promise}
   */

  searchs: (params) => {
    const convertedParams = strapi.services.searchs.convertSearchParams('landmarks', params);

    return Landmarks.query(function(qb) {
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
      withRelated: _.keys(_.groupBy(_.reject(strapi.models.landmarks.associations, {autoPopulate: false}), 'alias'))
    });
  }

};
