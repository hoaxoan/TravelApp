'use strict';

/**
 * Entitiesmoods.js service
 *
 * @description: A set of functions similar to controller's actions to avoid code duplication.
 */

// Public dependencies.
const _ = require('lodash');

// Strapi utilities.
const utils = require('strapi-bookshelf/lib/utils/');

module.exports = {

  /**
   * Promise to fetch all entitiesmoods.
   *
   * @return {Promise}
   */

  fetchAll: (params) => {
    const convertedParams = strapi.services.entitiesmoods.convertParams('entitiesmoods', params);

    return Entitiesmoods.query(function(qb) {
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
      withRelated: _.keys(_.groupBy(_.reject(strapi.models.entitiesmoods.associations, {autoPopulate: false}), 'alias'))
    });
  },

  /**
   * Promise to fetch a/an entitiesmoods.
   *
   * @return {Promise}
   */

  fetch: (params) => {
    return Entitiesmoods.forge(_.pick(params, 'id')).fetch({
      withRelated: _.keys(_.groupBy(_.reject(strapi.models.entitiesmoods.associations, {autoPopulate: false}), 'alias'))
    });
  },

  /**
   * Promise to add a/an entitiesmoods.
   *
   * @return {Promise}
   */

  add: async (values) => {
    const data = await Entitiesmoods.forge(_.omit(values, _.keys(_.groupBy(strapi.models.entitiesmoods.associations, 'alias')))).save();
    await strapi.hook.bookshelf.manageRelations('entitiesmoods', _.merge(_.clone(data.toJSON()), { values }));
    return data;
  },

  /**
   * Promise to edit a/an entitiesmoods.
   *
   * @return {Promise}
   */

  edit: async (params, values) => {
    await strapi.hook.bookshelf.manageRelations('entitiesmoods', _.merge(_.clone(params), { values }));
    return Entitiesmoods.forge(params).save(_.omit(values, _.keys(_.groupBy(strapi.models.entitiesmoods.associations, 'alias'))), {path: true});
  },

  /**
   * Promise to remove a/an entitiesmoods.
   *
   * @return {Promise}
   */

  remove: (params) => {
    _.forEach(Entitiesmoods.associations, async association => {
      await Entitiesmoods.forge(params)[association.alias]().detach();
    });
    return Entitiesmoods.forge(params).destroy();
  },

  convertParams: (entity, params) => {
    if (!entity) {
      throw new Error('You can\'t call the convert params method without passing the model\'s name as a first argument.');
    }

    const model = entity.toLowerCase();

    const models = _.assign(_.clone(strapi.models), Object.keys(strapi.plugins).reduce((acc, current) => {
      _.assign(acc, _.get(strapi.plugins[current], ['models'], {}));
      return acc;
    }, {}));

    if (!models.hasOwnProperty(model)) {
      return this.log.error(`The model ${model} can't be found.`);
    }

    const connector = models[model].orm;

    if (!connector) {
      throw new Error(`Impossible to determine the ORM used for the model ${model}.`);
    }

    const convertor = strapi.hook[connector].load().getQueryParams;
    const convertParams = {
      where: {},
      sort: '',
      start: 0,
      limit: 100
    };

    _.forEach(params, (value, key)  => {
      let result;

      if (_.includes(['_start', '_limit'], key)) {
        result = convertor(value, key);
      } else if (key === '_sort') {
        const [attr, order] = value.split(':');
        result = convertor(order, key, attr);
      } else if (key === '_q') {
        value = "%" + value + "%";
        result = {
          key : 'where.name',
          value : {
            symbol: 'like',
            value
          }
        };
      } else if ((key === 'trip_id' && value === '0')
      || (key === 'type' && value === '0')
      || (key === 'mood_id' && value === '0')) {
        result = null;
      } else if (key === 'ids') {
        result = {
          key : 'where.id',
          value : {
            orWhere: true,
            symbol: '=',
            value
          }
        };
      } else {
        const suffix = key.split('_');

        let type;

        if (_.includes(['ne', 'lt', 'gt', 'lte', 'gte'], _.last(suffix))) {
          type = `_${_.last(suffix)}`;
          key = _.dropRight(suffix).join('_');
        } else {
          type = '=';
        }

        result = convertor(value, type, key);
      }
      if(result != null){
        _.set(convertParams, result.key, result.value);
      }
    });

    return convertParams;
  }

};
