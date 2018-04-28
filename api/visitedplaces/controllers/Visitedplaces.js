'use strict';

/**
 * Visitedplaces.js controller
 *
 * @description: A set of functions called "actions" for managing `Visitedplaces`.
 */

module.exports = {

  /**
   * Retrieve visitedplaces records.
   *
   * @return {Object|Array}
   */

  find: async (ctx) => {
    const data = await strapi.services.visitedplaces.fetchByUser(ctx);

    // Send 200 `ok`
    ctx.send(data);
  },

  /**
   * Retrieve a visitedplaces record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    const data = await strapi.services.visitedplaces.fetch(ctx.params);

    // Send 200 `ok`
    ctx.send(data);
  },

  /**
   * Create a/an visitedplaces record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    const data = await strapi.services.visitedplaces.add(ctx.request.body);

    // Send 201 `created`
    ctx.created(data);
  },

  /**
   * Update a/an visitedplaces record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    const data = await strapi.services.visitedplaces.edit(ctx.params, ctx.request.body) ;

    // Send 200 `ok`
    ctx.send(data);
  },

  /**
   * Destroy a/an visitedplaces record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    const data = await strapi.services.visitedplaces.remove(ctx.params);

    // Send 200 `ok`
    ctx.send(data);
  },

  /**
   * Add relation to a/an visitedplaces record.
   *
   * @return {Object}
   */

  createRelation: async (ctx, next) => {
    const data = await strapi.services.visitedplaces.addRelation(ctx.params, ctx.request.body);

    // Send 200 `ok`
    ctx.send(data);
  },

  /**
   * Update relation to a/an visitedplaces record.
   *
   * @return {Object}
   */

  updateRelation: async (ctx, next) => {
    const data = await strapi.services.visitedplaces.editRelation(ctx.params, ctx.request.body);

    // Send 200 `ok`
    ctx.send(data);
  },

  /**
   * Destroy relation to a/an visitedplaces record.
   *
   * @return {Object}
   */

  destroyRelation: async (ctx, next) => {
    const data = await strapi.services.visitedplaces.removeRelation(ctx.params, ctx.request.body);

    // Send 200 `ok`
    ctx.send(data);
  }
};
