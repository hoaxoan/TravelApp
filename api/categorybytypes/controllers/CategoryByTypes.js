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
    const data = await strapi.services.categories.fetchByTypes(2);

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
  }
  
};
