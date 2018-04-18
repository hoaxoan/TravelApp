'use strict';

/**
 * Entities.js controller
 *
 * @description: A set of functions called "actions" for managing `Entities`.
 */

module.exports = {

  /**
   * Retrieve entities records.
   *
   * @return {Object|Array}
   */

  find: async (ctx) => {
    const data = await strapi.services.entities.fetchAll(ctx.query);

    // Send 200 `ok`
    ctx.send(data);
  },

  /**
   * Retrieve a entities record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    const data = await strapi.services.entities.fetch(ctx.params);

    // Send 200 `ok`
    ctx.send(data);
  },

  /**
   * Create a/an entities record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    const data = await strapi.services.entities.add(ctx.request.body);

    // Send 201 `created`
    ctx.created(data);
  },

  /**
   * Update a/an entities record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    const data = await strapi.services.entities.edit(ctx.params, ctx.request.body) ;

    // Send 200 `ok`
    ctx.send(data);
  },

  /**
   * Destroy a/an entities record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    const data = await strapi.services.entities.remove(ctx.params);

    // Send 200 `ok`
    ctx.send(data);
  },

  /**
   * Add relation to a/an entities record.
   *
   * @return {Object}
   */

  createRelation: async (ctx, next) => {
    const data = await strapi.services.entities.addRelation(ctx.params, ctx.request.body);

    // Send 200 `ok`
    ctx.send(data);
  },

  /**
   * Update relation to a/an entities record.
   *
   * @return {Object}
   */

  updateRelation: async (ctx, next) => {
    const data = await strapi.services.entities.editRelation(ctx.params, ctx.request.body);

    // Send 200 `ok`
    ctx.send(data);
  },

  /**
   * Destroy relation to a/an entities record.
   *
   * @return {Object}
   */

  destroyRelation: async (ctx, next) => {
    const data = await strapi.services.entities.removeRelation(ctx.params, ctx.request.body);

    // Send 200 `ok`
    ctx.send(data);
  }
};
