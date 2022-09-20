const con = require('../db/Db');

const getRoutes = async (req, res) => {
    con.
        promise()
        .query("SELECT * FROM Routes")
        .then(([rows, fields, err]) => {
            if (!err) {
                routesList = rows;
                return res.json(routesList);
            }
            else {
                return res.json({ msg: err.message });
            }
        })
        .catch((err) => {
            res.status(500).json({ success: false, error: err.message });
        });
}

module.exports = {
    getRoutes
}