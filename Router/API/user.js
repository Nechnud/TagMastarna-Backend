const express = require('express');

const {
    getAllUsers,
    postCustomer,
    postUser,
    getUser
} = require('../../Controller/Usr');

const routes = () => {
    const router = express.Router();

    router.get('/', getAllUsers);
    router.post('/', postCustomer);
    router.post('/user/:travelerId', postUser);
    router.get('/:id', getUser);

    return router;
}

module.exports = routes;