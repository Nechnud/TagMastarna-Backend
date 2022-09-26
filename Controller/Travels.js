const con = require('../db/Db');

const getRoutes = async (req, res) => {
    con.
        promise()
        .query("SELECT * FROM Routes")
        .then(([rows, fields, err]) => {
            if (!err) {
                return res.json(rows);
            }
            else {
                return res.json({ msg: err.message });
            }
        })
        .catch((err) => {
            res.status(500).json({ success: false, error: err.message });
        });
}

const getAvailableJourneyDates = async (req, res) => {
    con.
        promise()
        .query(
            "SELECT DISTINCT date(date_format(depFromFirstStationTime, '%Y-%m-%d'))" +
            "AS dates FROM Journey"
        )
        .then(([rows, fields, err]) => {
            if (!err) {
                return res.json(rows.map(x => x.dates));
            }
            else {
                return res.json({ msg: err.message });
            }
        })
        .catch((err) => {
            res.status(500).json({ success: false, error: err.message });
        })
}

const getRoutesForStation = async (req, res) => {
    if (!req.query.stationName) {
        res.status(500).json({ success: false, error: 'Incorrect parameters' });
        return;
    }

    con
        .promise()
        .query(
            `
                SELECT Routes.id
                FROM Routes, Station
                WHERE Routes.id = Station.route_id
                AND Station.stationName = ?
            `,
            [req.query.stationName]
        )
        .then(([rows, fields, err]) => {
            if (!err) {
                res.status(200).json({ success: true, data: rows });
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
    getRoutes,
    getAvailableJourneyDates,
    getRoutesForStation
}