const express = require('express');

const {
    getSeatsForJourney
} = require('../../Controller/Seats');

const routes = () => {
    const router = express.Router();

    router.get('/:id', getSeatsForJourney)

    return router;
}

module.exports = routes;