'use strict';

/**
 * Photos.js controller
 *
 * @description: A set of functions called "actions" for managing `Photos`.
 */

module.exports = {

  /**
   * Retrieve photos records.
   *
   * @return {Object|Array}
   */

  find: async (ctx) => {
    const data = await strapi.services.photos.fetchAll(ctx.query);

    // Send 200 `ok`
    ctx.send(data);
  },

  /**
   * Retrieve a photos record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    const data = await strapi.services.photos.fetch(ctx.params);

    // Send 200 `ok`
    ctx.send(data);
  },

  /**
   * Create a/an photos record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    const data = await strapi.services.photos.add(ctx.request.body);

    // Send 201 `created`
    ctx.created(data);
  },

  /**
   * Update a/an photos record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    const data = await strapi.services.photos.edit(ctx.params, ctx.request.body) ;

    // Send 200 `ok`
    ctx.send(data);
  },

  /**
   * Destroy a/an photos record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    const data = await strapi.services.photos.remove(ctx.params);

    // Send 200 `ok`
    ctx.send(data);
  },

  /**
   * Add relation to a/an photos record.
   *
   * @return {Object}
   */

  createRelation: async (ctx, next) => {
    const data = await strapi.services.photos.addRelation(ctx.params, ctx.request.body);

    // Send 200 `ok`
    ctx.send(data);
  },

  /**
   * Update relation to a/an photos record.
   *
   * @return {Object}
   */

  updateRelation: async (ctx, next) => {
    const data = await strapi.services.photos.editRelation(ctx.params, ctx.request.body);

    // Send 200 `ok`
    ctx.send(data);
  },

  /**
   * Destroy relation to a/an photos record.
   *
   * @return {Object}
   */

  destroyRelation: async (ctx, next) => {
    const data = await strapi.services.photos.removeRelation(ctx.params, ctx.request.body);

    // Send 200 `ok`
    ctx.send(data);
  }
};
