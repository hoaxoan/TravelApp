'use strict';

/**
 * Restaurants.js controller
 *
 * @description: A set of functions called "actions" for managing `Restaurants`.
 */

module.exports = {

  /**
   * Retrieve restaurants records.
   *
   * @return {Object|Array}
   */

  find: async (ctx) => {
    const data = await strapi.services.restaurants.fetchAll(ctx.query);

    // Send 200 `ok`
    ctx.send(data);
  },

  /**
   * Retrieve a restaurants record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    const data = await strapi.services.restaurants.fetch(ctx.params);

    // Send 200 `ok`
    ctx.send(data);
  },

  /**
   * Create a/an restaurants record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    const data = await strapi.services.restaurants.add(ctx.request.body);

    // Send 201 `created`
    ctx.created(data);
  },

  /**
   * Update a/an restaurants record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    const data = await strapi.services.restaurants.edit(ctx.params, ctx.request.body) ;

    // Send 200 `ok`
    ctx.send(data);
  },

  /**
   * Destroy a/an restaurants record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    const data = await strapi.services.restaurants.remove(ctx.params);

    // Send 200 `ok`
    ctx.send(data);
  },

  /**
   * Add relation to a/an restaurants record.
   *
   * @return {Object}
   */

  createRelation: async (ctx, next) => {
    const data = await strapi.services.restaurants.addRelation(ctx.params, ctx.request.body);

    // Send 200 `ok`
    ctx.send(data);
  },

  /**
   * Update relation to a/an restaurants record.
   *
   * @return {Object}
   */

  updateRelation: async (ctx, next) => {
    const data = await strapi.services.restaurants.editRelation(ctx.params, ctx.request.body);

    // Send 200 `ok`
    ctx.send(data);
  },

  /**
   * Destroy relation to a/an restaurants record.
   *
   * @return {Object}
   */

  destroyRelation: async (ctx, next) => {
    const data = await strapi.services.restaurants.removeRelation(ctx.params, ctx.request.body);

    // Send 200 `ok`
    ctx.send(data);
  }
};
