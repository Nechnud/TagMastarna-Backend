const express = require('express');

const {
    getAllUsers,
    getUser
} = require('../../Controller/Usr');

const routes = () => {
    const router = express.Router();

    router.get('/', getAllUsers);
    router.get('/:id', getUser);

    return router;
}

module.exports = routes;