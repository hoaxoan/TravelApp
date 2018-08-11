'use strict';

/**
 * Guidelines.js controller
 *
 * @description: A set of functions called "actions" for managing `Guidelines`.
 */

module.exports = {

  /**
   * Retrieve guidelines records.
   *
   * @return {Object|Array}
   */

  find: async (ctx) => {
    const data = await strapi.services.guidelines.fetchBySubGuidelines(ctx.query);

    // Send 200 `ok`
    ctx.send(data);
  },

  /**
   * Retrieve a guidelines record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    const data = await strapi.services.guidelines.fetch(ctx.params);

    // Send 200 `ok`
    ctx.send(data);
  },

  /**
   * Create a/an guidelines record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    const data = await strapi.services.guidelines.add(ctx.request.body);

    // Send 201 `created`
    ctx.created(data);
  },

  /**
   * Update a/an guidelines record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    const data = await strapi.services.guidelines.edit(ctx.params, ctx.request.body) ;

    // Send 200 `ok`
    ctx.send(data);
  },

  /**
   * Destroy a/an guidelines record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    const data = await strapi.services.guidelines.remove(ctx.params);

    // Send 200 `ok`
    ctx.send(data);
  },

  /**
   * Add relation to a/an guidelines record.
   *
   * @return {Object}
   */

  createRelation: async (ctx, next) => {
    const data = await strapi.services.guidelines.addRelation(ctx.params, ctx.request.body);

    // Send 200 `ok`
    ctx.send(data);
  },

  /**
   * Update relation to a/an guidelines record.
   *
   * @return {Object}
   */

  updateRelation: async (ctx, next) => {
    const data = await strapi.services.guidelines.editRelation(ctx.params, ctx.request.body);

    // Send 200 `ok`
    ctx.send(data);
  },

  /**
   * Destroy relation to a/an guidelines record.
   *
   * @return {Object}
   */

  destroyRelation: async (ctx, next) => {
    const data = await strapi.services.guidelines.removeRelation(ctx.params, ctx.request.body);

    // Send 200 `ok`
    ctx.send(data);
  }
};
