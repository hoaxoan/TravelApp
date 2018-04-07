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
  }

};
