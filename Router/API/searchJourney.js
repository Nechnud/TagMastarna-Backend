const express = require('express');

const {
    getRoutes,
    getAvailableJourneyDates,
    getRoutesForStation,
    getJourneysWithoutChangeRequired
} = require('../../Controller/Travels');

const {
    getStationsForRoute
} = require('../../Controller/Stations')

const routes = () => {
    const router = express.Router();

    router.get('/routes', getRoutes);
    router.get('/dates', getAvailableJourneyDates);
    router.get('/station', getRoutesForStation);
    router.get('/stations/:id', getStationsForRoute)
    router.get('/', getJourneysWithoutChangeRequired);

    return router;
}

module.exports = routes;