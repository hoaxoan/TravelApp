'use strict';

/**
 * Categories.js controller
 *
 * @description: A set of functions called "actions" for managing `Categories`.
 */

module.exports = {

  /**
   * Retrieve categories records.
   *
   * @return {Object|Array}
   */

  find: async (ctx) => {
    const data = await strapi.services.categories.fetchAll(ctx.query);

    // Send 200 `ok`
    ctx.send(data);
  },

  /**
   * Retrieve a categories record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    const data = await strapi.services.categories.fetch(ctx.params);

    // Send 200 `ok`
    ctx.send(data);
  },

  /**
   * Create a/an categories record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    const data = await strapi.services.categories.add(ctx.request.body);

    // Send 201 `created`
    ctx.created(data);
  },

  /**
   * Update a/an categories record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    const data = await strapi.services.categories.edit(ctx.params, ctx.request.body) ;

    // Send 200 `ok`
    ctx.send(data);
  },

  /**
   * Destroy a/an categories record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    const data = await strapi.services.categories.remove(ctx.params);

    // Send 200 `ok`
    ctx.send(data);
  },

  /**
   * Add relation to a/an categories record.
   *
   * @return {Object}
   */

  createRelation: async (ctx, next) => {
    const data = await strapi.services.categories.addRelation(ctx.params, ctx.request.body);

    // Send 200 `ok`
    ctx.send(data);
  },

  /**
   * Update relation to a/an categories record.
   *
   * @return {Object}
   */

  updateRelation: async (ctx, next) => {
    const data = await strapi.services.categories.editRelation(ctx.params, ctx.request.body);

    // Send 200 `ok`
    ctx.send(data);
  },

  /**
   * Destroy relation to a/an categories record.
   *
   * @return {Object}
   */

  destroyRelation: async (ctx, next) => {
    const data = await strapi.services.categories.removeRelation(ctx.params, ctx.request.body);

    // Send 200 `ok`
    ctx.send(data);
  }
};
