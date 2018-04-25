'use strict';

/**
 * Destinations.js controller
 *
 * @description: A set of functions called "actions" for managing `Destinations`.
 */

module.exports = {

  /**
   * Retrieve destinations records.
   *
   * @return {Object|Array}
   */

  find: async (ctx) => {
    return strapi.services.destinations.fetchAll(ctx.query);
  },

  /**
   * Retrieve a destinations record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.destinations.fetch(ctx.params);
  },

  /**
   * Create a/an destinations record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.destinations.add(ctx.request.body);
  },

  /**
   * Update a/an destinations record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.destinations.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an destinations record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.destinations.remove(ctx.params);
  },

  /**
   * Add relation to a/an destinations record.
   *
   * @return {Object}
   */

  createRelation: async (ctx, next) => {
    return strapi.services.destinations.addRelation(ctx.params, ctx.request.body);
  },

  /**
   * Update relation to a/an destinations record.
   *
   * @return {Object}
   */

  updateRelation: async (ctx, next) => {
    return strapi.services.destinations.editRelation(ctx.params, ctx.request.body);
  },

  /**
   * Destroy relation to a/an destinations record.
   *
   * @return {Object}
   */

  destroyRelation: async (ctx, next) => {
    return strapi.services.destinations.removeRelation(ctx.params, ctx.request.body);
  }
};
