'use strict';

/**
 * Amenities.js controller
 *
 * @description: A set of functions called "actions" for managing `Amenities`.
 */

module.exports = {

  /**
   * Retrieve amenities records.
   *
   * @return {Object|Array}
   */

  find: async (ctx) => {
    const data = await strapi.services.amenities.fetchAll(ctx.query);

    // Send 200 `ok`
    ctx.send(data);
  },

  /**
   * Retrieve a amenities record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    const data = await strapi.services.amenities.fetch(ctx.params);

    // Send 200 `ok`
    ctx.send(data);
  },

  /**
   * Create a/an amenities record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    const data = await strapi.services.amenities.add(ctx.request.body);

    // Send 201 `created`
    ctx.created(data);
  },

  /**
   * Update a/an amenities record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    const data = await strapi.services.amenities.edit(ctx.params, ctx.request.body) ;

    // Send 200 `ok`
    ctx.send(data);
  },

  /**
   * Destroy a/an amenities record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    const data = await strapi.services.amenities.remove(ctx.params);

    // Send 200 `ok`
    ctx.send(data);
  },

  /**
   * Add relation to a/an amenities record.
   *
   * @return {Object}
   */

  createRelation: async (ctx, next) => {
    const data = await strapi.services.amenities.addRelation(ctx.params, ctx.request.body);

    // Send 200 `ok`
    ctx.send(data);
  },

  /**
   * Update relation to a/an amenities record.
   *
   * @return {Object}
   */

  updateRelation: async (ctx, next) => {
    const data = await strapi.services.amenities.editRelation(ctx.params, ctx.request.body);

    // Send 200 `ok`
    ctx.send(data);
  },

  /**
   * Destroy relation to a/an amenities record.
   *
   * @return {Object}
   */

  destroyRelation: async (ctx, next) => {
    const data = await strapi.services.amenities.removeRelation(ctx.params, ctx.request.body);

    // Send 200 `ok`
    ctx.send(data);
  }
};
