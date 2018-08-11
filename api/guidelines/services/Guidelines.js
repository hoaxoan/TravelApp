'use strict';

/**
 * Guidelines.js service
 *
 * @description: A set of functions similar to controller's actions to avoid code duplication.
 */

// Public dependencies.
const _ = require('lodash');

// Strapi utilities.
const utils = require('strapi-bookshelf/lib/utils/');

module.exports = {

  /**
   * Promise to fetch all guidelines.
   *
   * @return {Promise}
   */

  fetchAll: (params) => {
    const convertedParams = strapi.utils.models.convertParams('guidelines', params);

    return Guidelines.query(function(qb) {
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
      withRelated: _.keys(_.groupBy(_.reject(strapi.models.guidelines.associations, {autoPopulate: false}), 'alias'))
    });
  },

  /**
   * Promise to fetch a/an guidelines.
   *
   * @return {Promise}
   */

  fetch: (params) => {
    return Guidelines.forge(_.pick(params, 'id')).fetch({
      withRelated: _.keys(_.groupBy(_.reject(strapi.models.guidelines.associations, {autoPopulate: false}), 'alias'))
    });
  },

  /**
   * Promise to add a/an guidelines.
   *
   * @return {Promise}
   */

  add: async (values) => {
    const data = await Guidelines.forge(_.omit(values, _.keys(_.groupBy(strapi.models.guidelines.associations, 'alias')))).save();
    await strapi.hook.bookshelf.manageRelations('guidelines', _.merge(_.clone(data.toJSON()), { values }));
    return data;
  },

  /**
   * Promise to edit a/an guidelines.
   *
   * @return {Promise}
   */

  edit: async (params, values) => {
    await strapi.hook.bookshelf.manageRelations('guidelines', _.merge(_.clone(params), { values }));
    return Guidelines.forge(params).save(_.omit(values, _.keys(_.groupBy(strapi.models.guidelines.associations, 'alias'))), {path: true});
  },

  /**
   * Promise to remove a/an guidelines.
   *
   * @return {Promise}
   */

  remove: (params) => {
    _.forEach(Guidelines.associations, async association => {
      await Guidelines.forge(params)[association.alias]().detach();
    });
    return Guidelines.forge(params).destroy();
  },


  /**
   * Promise to fetch all guidelines.
   *
   * @return {Promise}
   */

  fetchBySubGuidelines: async (params) => {
    
    var parentId = _.pick(params, 'parent_id').parent_id;

    if(parentId != null && parentId != '0'){
      const guideline = await strapi.services.guidelines.fetch({'id': _.pick(params, 'parent_id').parent_id});
      const guidelines = await strapi.services.guidelines.fetchAll(params);
      
      _.set(guideline, 'attributes.guidelines', guidelines);
  
      return guideline;
    } else {
      return await strapi.services.guidelines.fetchAll(params);  
    }
    
  }

};
