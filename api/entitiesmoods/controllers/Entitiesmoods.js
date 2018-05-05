'use strict';

/**
 * Entitiesmoods.js controller
 *
 * @description: A set of functions called "actions" for managing `Entitiesmoods`.
 */

module.exports = {

  /**
   * Retrieve entitiesmoods records.
   *
   * @return {Object|Array}
   */

  find: async (ctx) => {
    return strapi.services.entitiesmoods.fetchAll(ctx.query);
  },

  /**
   * Retrieve a entitiesmoods record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.entitiesmoods.fetch(ctx.params);
  },

  /**
   * Create a/an entitiesmoods record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.entitiesmoods.add(ctx.request.body);
  },

  /**
   * Update a/an entitiesmoods record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.entitiesmoods.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an entitiesmoods record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.entitiesmoods.remove(ctx.params);
  },

  /**
   * Add relation to a/an entitiesmoods record.
   *
   * @return {Object}
   */

  createRelation: async (ctx, next) => {
    return strapi.services.entitiesmoods.addRelation(ctx.params, ctx.request.body);
  },

  /**
   * Update relation to a/an entitiesmoods record.
   *
   * @return {Object}
   */

  updateRelation: async (ctx, next) => {
    return strapi.services.entitiesmoods.editRelation(ctx.params, ctx.request.body);
  },

  /**
   * Destroy relation to a/an entitiesmoods record.
   *
   * @return {Object}
   */

  destroyRelation: async (ctx, next) => {
    return strapi.services.entitiesmoods.removeRelation(ctx.params, ctx.request.body);
  }
};
