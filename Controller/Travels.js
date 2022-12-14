const con = require('../db/Db');

const getRoutes = async (req, res) => {
    con.
        promise()
        .query("SELECT * FROM Routes")
        .then(([rows, fields, err]) => {
            if (!err) {
                return res.json({ data: rows });
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
                return res.json({ success: true, data: rows.map(x => x.dates) });
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

const getJourneysWithoutChangeRequired = async (req, res) => {
    if (!req.query.startStation || !req.query.endStation) {
        res.status(500).json({ success: false, error: 'Incorrect parameters' });
        return;
    }
    let date = req.query.date ? req.query.date : new Date().toISOString().split('T')[0];

    con
        .promise()
        .query(
            `
                WITH start_station_data AS (
                    SELECT id, route_id, arrival, departure, stationName
                    FROM station
                    WHERE stationName = ?
                )
                SELECT 
                    station.id AS "endStationId", station.route_id, 
                        station.stationName AS "endDestination", 
                        station.arrival AS "endStationArrival", 
                    journey.id AS journeyId, journey.depFromFirstStationTime, journey.trainSet_id,
                    start_station_data.id AS "startStationId",
                        start_station_data.arrival AS "startStationArrival", 
                        start_station_data.departure AS "startStationDeparture",
                        start_station_data.stationName AS "startStation"
                FROM station, journey, start_station_data
                WHERE station.stationName = ?
                AND station.arrival > start_station_data.departure
                AND station.route_id IN (
                    SELECT route_id
                    FROM start_station_data
                )
                AND journey.route_id IN (
                    SELECT route_id
                    FROM start_station_data
                )
                AND start_station_data.route_id = station.route_id
                AND station.route_id = journey.route_id
                AND DATE(journey.depFromFirstStationTime) = ?
                ORDER BY journey.depFromFirstStationTime
            `,
            [req.query.startStation, req.query.endStation, date]
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
    getRoutesForStation,
    getJourneysWithoutChangeRequired
}