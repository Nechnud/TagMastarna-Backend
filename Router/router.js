const express = require("express");
const user = require('./API/user');
const searchJourney = require("./API/searchJourney.js");
const selectSeats = require("./API/selectSeats.js");
const booking = require("./API/booking.js");

const routes = () => {
  const router = express.Router();

  // Register route to api-layer.
  router.use("/user", user());
  router.use("/searchJourney", searchJourney());
  router.use("/selectSeats", selectSeats());
  router.use("/booking", booking());

  return router;
};

module.exports = routes;
