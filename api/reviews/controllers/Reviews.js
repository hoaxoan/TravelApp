'use strict';

/**
 * Reviews.js controller
 *
 * @description: A set of functions called "actions" for managing `Reviews`.
 */

module.exports = {

  /**
   * Retrieve reviews records.
   *
   * @return {Object|Array}
   */

  find: async (ctx) => {
    const data = await strapi.services.reviews.fetchAll(ctx.query);

    // Send 200 `ok`
    ctx.send(data);
  },

  /**
   * Retrieve a reviews record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    const data = await strapi.services.reviews.fetch(ctx.params);

    // Send 200 `ok`
    ctx.send(data);
  },

  /**
   * Create a/an reviews record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    const data = await strapi.services.reviews.add(ctx.request.body);

    // Send 201 `created`
    ctx.created(data);
  },

  /**
   * Update a/an reviews record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    const data = await strapi.services.reviews.edit(ctx.params, ctx.request.body) ;

    // Send 200 `ok`
    ctx.send(data);
  },

  /**
   * Destroy a/an reviews record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    const data = await strapi.services.reviews.remove(ctx.params);

    // Send 200 `ok`
    ctx.send(data);
  },

  /**
   * Add relation to a/an reviews record.
   *
   * @return {Object}
   */

  createRelation: async (ctx, next) => {
    const data = await strapi.services.reviews.addRelation(ctx.params, ctx.request.body);

    // Send 200 `ok`
    ctx.send(data);
  },

  /**
   * Update relation to a/an reviews record.
   *
   * @return {Object}
   */

  updateRelation: async (ctx, next) => {
    const data = await strapi.services.reviews.editRelation(ctx.params, ctx.request.body);

    // Send 200 `ok`
    ctx.send(data);
  },

  /**
   * Destroy relation to a/an reviews record.
   *
   * @return {Object}
   */

  destroyRelation: async (ctx, next) => {
    const data = await strapi.services.reviews.removeRelation(ctx.params, ctx.request.body);

    // Send 200 `ok`
    ctx.send(data);
  }
};
