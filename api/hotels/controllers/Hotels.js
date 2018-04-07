'use strict';

/**
 * Hotels.js controller
 *
 * @description: A set of functions called "actions" for managing `Hotels`.
 */

module.exports = {

  /**
   * Retrieve hotels records.
   *
   * @return {Object|Array}
   */

  find: async (ctx) => {
    const data = await strapi.services.hotels.fetchAll(ctx.query);

    // Send 200 `ok`
    ctx.send(data);
  },

  /**
   * Retrieve a hotels record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    const data = await strapi.services.hotels.fetch(ctx.params);

    // Send 200 `ok`
    ctx.send(data);
  },

  /**
   * Create a/an hotels record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    const data = await strapi.services.hotels.add(ctx.request.body);

    // Send 201 `created`
    ctx.created(data);
  },

  /**
   * Update a/an hotels record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    const data = await strapi.services.hotels.edit(ctx.params, ctx.request.body) ;

    // Send 200 `ok`
    ctx.send(data);
  },

  /**
   * Destroy a/an hotels record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    const data = await strapi.services.hotels.remove(ctx.params);

    // Send 200 `ok`
    ctx.send(data);
  },

  /**
   * Add relation to a/an hotels record.
   *
   * @return {Object}
   */

  createRelation: async (ctx, next) => {
    const data = await strapi.services.hotels.addRelation(ctx.params, ctx.request.body);

    // Send 200 `ok`
    ctx.send(data);
  },

  /**
   * Update relation to a/an hotels record.
   *
   * @return {Object}
   */

  updateRelation: async (ctx, next) => {
    const data = await strapi.services.hotels.editRelation(ctx.params, ctx.request.body);

    // Send 200 `ok`
    ctx.send(data);
  },

  /**
   * Destroy relation to a/an hotels record.
   *
   * @return {Object}
   */

  destroyRelation: async (ctx, next) => {
    const data = await strapi.services.hotels.removeRelation(ctx.params, ctx.request.body);

    // Send 200 `ok`
    ctx.send(data);
  }
};
