const express = require('express');

const {
    getRoutes
} = require('../../Controller/Travels');

const routes = () => {
    const router = express.Router();

    router.get('/routes', getRoutes);

    return router;
}

module.exports = routes;