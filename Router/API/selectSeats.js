const express = require('express');

const {
    getSeatsForJourney,
    getAvailableSeats
} = require('../../Controller/Seats');

const routes = () => {
    const router = express.Router();

    router.get('/:id', getSeatsForJourney)
    router.get('/seats/:id', getAvailableSeats)

    return router;
}

module.exports = routes;