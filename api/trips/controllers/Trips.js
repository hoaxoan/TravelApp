'use strict';

/**
 * Trips.js controller
 *
 * @description: A set of functions called "actions" for managing `Trips`.
 */

module.exports = {

  /**
   * Retrieve trips records.
   *
   * @return {Object|Array}
   */

  find: async (ctx) => {
    const data = await strapi.services.trips.fetchAll(ctx.query);

    // Send 200 `ok`
    ctx.send(data);
  },

  /**
   * Retrieve a trips record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    const data = await strapi.services.trips.fetch(ctx.params);

    // Send 200 `ok`
    ctx.send(data);
  },

  /**
   * Create a/an trips record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    const data = await strapi.services.trips.add(ctx.request.body);

    // Send 201 `created`
    ctx.created(data);
  },

  /**
   * Update a/an trips record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    const data = await strapi.services.trips.edit(ctx.params, ctx.request.body) ;

    // Send 200 `ok`
    ctx.send(data);
  },

  /**
   * Destroy a/an trips record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    const data = await strapi.services.trips.remove(ctx.params);

    // Send 200 `ok`
    ctx.send(data);
  },

  /**
   * Add relation to a/an trips record.
   *
   * @return {Object}
   */

  createRelation: async (ctx, next) => {
    const data = await strapi.services.trips.addRelation(ctx.params, ctx.request.body);

    // Send 200 `ok`
    ctx.send(data);
  },

  /**
   * Update relation to a/an trips record.
   *
   * @return {Object}
   */

  updateRelation: async (ctx, next) => {
    const data = await strapi.services.trips.editRelation(ctx.params, ctx.request.body);

    // Send 200 `ok`
    ctx.send(data);
  },

  /**
   * Destroy relation to a/an trips record.
   *
   * @return {Object}
   */

  destroyRelation: async (ctx, next) => {
    const data = await strapi.services.trips.removeRelation(ctx.params, ctx.request.body);

    // Send 200 `ok`
    ctx.send(data);
  }
};
