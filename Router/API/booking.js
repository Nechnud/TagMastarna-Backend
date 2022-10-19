const express = require('express');

const {
    postBookingAndTickets,
    postConfirmationEmail
} = require('../../Controller/Bookings');

const routes = () => {
    const router = express.Router();

    router.post('/', postBookingAndTickets);
    router.post('/confirmationEmail', postConfirmationEmail);

    return router;
}

module.exports = routes;