const express = require('express');

const {
    getAllUsers,
    postCustomer,
    postUser,
    getUser,
    userLogin,
    getUserIdByEmail,
    getBookingsByEmail
} = require('../../Controller/Usr');

const routes = () => {
    const router = express.Router();

    router.get('/', getAllUsers);
    router.post('/', postCustomer);
    router.post('/user/:travelerId', postUser);
    router.get('/user/:email', getUserIdByEmail);
    router.get('/:id', getUser);
    router.post('/login', userLogin);
    router.get('/bookings/:email', getBookingsByEmail);

    return router;
}

module.exports = routes;