const express = require("express");

//const usr = require("../Controller/api/Usr.js");
const user = require('./API/user');
const searchJourney = require("./api/searchJourney.js");
const selectSeats = require("./api/selectSeats.js");
const booking = require("./api/booking.js");

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
