const express = require('express');

const {
    getRoutes,
    getAvailableJourneyDates,
    getRoutesForStation
} = require('../../Controller/Travels');

const routes = () => {
    const router = express.Router();

    router.get('/routes', getRoutes);
    router.get('/dates', getAvailableJourneyDates);
    router.get('/station', getRoutesForStation);

    return router;
}

module.exports = routes;