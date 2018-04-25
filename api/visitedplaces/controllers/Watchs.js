'use strict';

/**
 * Visitedplaces.js controller
 *
 * @description: A set of functions called "actions" for managing `Visitedplaces`.
 */

module.exports = {

  /**
   * Retrieve visitedplaces records.
   *
   * @return {Object|Array}
   */

  find: async (ctx) => {
    const data = await strapi.services.visitedplaces.fetchAll(ctx.query);

    // Send 200 `ok`
    ctx.send(data);
  }

};
