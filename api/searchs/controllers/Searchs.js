'use strict';

/**
 * Searchs.js controller
 *
 * @description: A set of functions called "actions" for managing `Trips`.
 */

module.exports = {

  /**
   * Retrieve searchs records.
   *
   * @return {Object|Array}
   */

  find: async (ctx) => {
    const data = await strapi.services.searchs.searchs(ctx.query);

    // Send 200 `ok`
    ctx.send(data);
  }

};
