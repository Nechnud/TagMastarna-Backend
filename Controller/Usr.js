const con = require('../db/Db');

const getAllUsers = async (req, res) => {
    con
        .promise()
        .query("SELECT * FROM Usr")
        .then(([rows, fields, err]) => {
            if (!err) {
                userList = rows;
                return res.json({ success: true, data: userList });
            } else {
                return res.json({ msg: err.message });
            }
        })
        .catch((err) => {
            res.status(500).json({ success: false, error: err.message });
        });
}

const postCustomer = async (req, res) => {
    if (!req.body.name || !req.body.email || !req.body.phoneNumber) {
        res.status(500).json({ success: false, error: err.message });
        return;
    }

    con
        .promise()
        .query(
            "INSERT INTO Customer (name, email, phoneNumber)" +
            "VALUES (?, ?, ?)",
            [req.body.name, req.body.email, req.body.phoneNumber]
        )
        .catch((err) => {
            res.status(500).json({ success: false, error: err.message });
            return;
        });
    res.status(200).json({ success: true, result: 'Customer created' });
}

const postUser = async (req, res) => {
    if (!req.params.travelerId || !req.body.paymentMethod || !req.body.password) {
        res.status(500).json({ success: false, error: err.message });
        return;
    }

    con
        .promise()
        .query(
            "INSERT INTO Usr (traveler_id, paymentMethod, password)" +
            "VALUES (?, ?, ?)",
            [req.params.travelerId, req.body.paymentMethod, req.body.password]
        )
        .catch((err) => {
            res.status(500).json({ success: false, error: err.message });
            return;
        });
    res.status(200).json({ success: true, result: 'User created' });
    return;
}

const getUser = async (req, res) => {
    if (!req.params.id) {
        res.status(500).json({ success: false, error: err.message });
        return;
    }

    con
        .promise()
        .query(
            "SELECT * FROM Usr WHERE id = ?",
            [req.params.id]
        )
        .then(([rows, fields, err]) => {
            if (!err) {
                userList = rows;
                return res.json({ success: true, data: userList });
            } else {
                return res.json({ msg: err.message });
            }
        })
        .catch((err) => {
            console.log(err.message);
        });
}

const userLogin = (req, res) => {
    if (!req.body.email || !req.body.password) {
        res.status(500).json({ success: false, error: err.message });
        return;
    }

    con
        .promise()
        .query(
            `
                SELECT * 
                FROM Usr, customer 
                WHERE customer.id = Usr.traveler_id
                AND customer.email = ?
                AND Usr.password = ?
            `,
            [req.body.email, req.body.password]
        )
        .then(([rows, fields, err]) => {
            if (!err) {
                return res.json({ success: true, data: rows });
            }
            else {
                return res.json({ success: false, error: 'Login failed.' });
            }
        })
        .catch((err) => {
            console.log(err.message);
        });
}


module.exports = {
    getAllUsers,
    postCustomer,
    postUser,
    getUser,
    userLogin
}