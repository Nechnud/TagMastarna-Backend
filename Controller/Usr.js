const con = require('../Db');

const getAllUsers = async (req, res) => {
    con
        .promise()
        .query("SELECT * FROM Usr")
        .then(([rows, fields, err]) => {
            if (!err) {
                userList = rows;
                return res.json(userList);
            } else {
                return res.json({ msg: err.message });
            }
        }).catch((err) => {
            console.log('error');
        });
};

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
                return res.json(userList);
            } else {
                return res.json({ msg: err.message });
            }
        }).catch((err) => {
            console.log('error');
        });
}

module.exports = {
    getAllUsers,
    getUser
}