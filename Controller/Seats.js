const con = require('../db/Db');

const getSeatsForJourney = async (req, res) => {
    con.
        promise()
        .query(
            `
                SELECT trainset.id, depFromFirstStationTime, handicap, seatNumber 
                FROM journey
                INNER JOIN trainset
                ON journey.trainSet_id = trainset.id
                INNER JOIN carriage
                ON carriage.trainSet_id = trainset.id
                INNER JOIN seat
                ON carriage.id = seat.carriage_id
                WHERE journey.id = ?
            `,
            [req.params.id]
        )
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
        })
}

module.exports = {
    getSeatsForJourney
}