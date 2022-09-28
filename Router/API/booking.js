const express = require('express');

const {
    postBookingAndTickets
} = require('../../Controller/Bookings');

const routes = () => {
    const router = express.Router();

    router.post('/', postBookingAndTickets);

    return router;
}

module.exports = routes;