'use strict';

/**
 * Landmarks.js controller
 *
 * @description: A set of functions called "actions" for managing `Landmarks`.
 */

module.exports = {

  /**
   * Retrieve landmarks records.
   *
   * @return {Object|Array}
   */

  find: async (ctx) => {
    const data = await strapi.services.landmarks.fetchAll(ctx.query);

    // Send 200 `ok`
    ctx.send(data);
  },

  /**
   * Retrieve a landmarks record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    const data = await strapi.services.landmarks.fetch(ctx.params);

    // Send 200 `ok`
    ctx.send(data);
  },

  /**
   * Create a/an landmarks record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    const data = await strapi.services.landmarks.add(ctx.request.body);

    // Send 201 `created`
    ctx.created(data);
  },

  /**
   * Update a/an landmarks record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    const data = await strapi.services.landmarks.edit(ctx.params, ctx.request.body) ;

    // Send 200 `ok`
    ctx.send(data);
  },

  /**
   * Destroy a/an landmarks record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    const data = await strapi.services.landmarks.remove(ctx.params);

    // Send 200 `ok`
    ctx.send(data);
  },

  /**
   * Add relation to a/an landmarks record.
   *
   * @return {Object}
   */

  createRelation: async (ctx, next) => {
    const data = await strapi.services.landmarks.addRelation(ctx.params, ctx.request.body);

    // Send 200 `ok`
    ctx.send(data);
  },

  /**
   * Update relation to a/an landmarks record.
   *
   * @return {Object}
   */

  updateRelation: async (ctx, next) => {
    const data = await strapi.services.landmarks.editRelation(ctx.params, ctx.request.body);

    // Send 200 `ok`
    ctx.send(data);
  },

  /**
   * Destroy relation to a/an landmarks record.
   *
   * @return {Object}
   */

  destroyRelation: async (ctx, next) => {
    const data = await strapi.services.landmarks.removeRelation(ctx.params, ctx.request.body);

    // Send 200 `ok`
    ctx.send(data);
  }
};
