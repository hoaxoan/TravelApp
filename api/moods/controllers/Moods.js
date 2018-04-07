'use strict';

/**
 * Moods.js controller
 *
 * @description: A set of functions called "actions" for managing `Moods`.
 */

module.exports = {

  /**
   * Retrieve moods records.
   *
   * @return {Object|Array}
   */

  find: async (ctx) => {
    const data = await strapi.services.moods.fetchAll(ctx.query);

    // Send 200 `ok`
    ctx.send(data);
  },

  /**
   * Retrieve a moods record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    const data = await strapi.services.moods.fetch(ctx.params);

    // Send 200 `ok`
    ctx.send(data);
  },

  /**
   * Create a/an moods record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    const data = await strapi.services.moods.add(ctx.request.body);

    // Send 201 `created`
    ctx.created(data);
  },

  /**
   * Update a/an moods record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    const data = await strapi.services.moods.edit(ctx.params, ctx.request.body) ;

    // Send 200 `ok`
    ctx.send(data);
  },

  /**
   * Destroy a/an moods record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    const data = await strapi.services.moods.remove(ctx.params);

    // Send 200 `ok`
    ctx.send(data);
  },

  /**
   * Add relation to a/an moods record.
   *
   * @return {Object}
   */

  createRelation: async (ctx, next) => {
    const data = await strapi.services.moods.addRelation(ctx.params, ctx.request.body);

    // Send 200 `ok`
    ctx.send(data);
  },

  /**
   * Update relation to a/an moods record.
   *
   * @return {Object}
   */

  updateRelation: async (ctx, next) => {
    const data = await strapi.services.moods.editRelation(ctx.params, ctx.request.body);

    // Send 200 `ok`
    ctx.send(data);
  },

  /**
   * Destroy relation to a/an moods record.
   *
   * @return {Object}
   */

  destroyRelation: async (ctx, next) => {
    const data = await strapi.services.moods.removeRelation(ctx.params, ctx.request.body);

    // Send 200 `ok`
    ctx.send(data);
  }
};
