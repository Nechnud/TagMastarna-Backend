const con = require('../db/Db');

const postBookingAndTickets = async (req, res) => {
    if (
        !req.body.customerId || !req.body.journeyId || !req.body.cancellationProtection ||
        !req.body.travelers ||
        //!req.body.travelerName || !req.body.travelerCategory || !req.body.seat_id ||
        !req.body.departureTime || !req.body.startStationId || !req.body.endStationId
    ) {
        res.status(500).json({ success: false, error: 'Incorrect parameters' });
        return;
    }

    con.promise()
        .query(
            `
                INSERT INTO Booking SET ? 
            `,
            {
                customer_id: req.body.customerId,
                journey_id: req.body.journeyId,
                cancellationProtection: 0//req.body.cancellationProtection
            }, (err, results, fields) => {
                if (err) {
                    throw err;
                }
            }
        )
        .then(([rows, fields, err]) => {
            if (!err) {
                req.body.travelers.map(traveler => {
                    con.query(
                        `
                            INSERT INTO Ticket(
                                travelerName, travelerCategory, booking_id, seat_id,
                                departureTime, startStartion_id, endStation_id
                            )
                            VALUES(?, ?, ?, ?, ?, ?, ?)
                        `,
                        [
                            traveler.travelerName, traveler.travelerCategory, rows.insertId,
                            traveler.seatId, req.body.departureTime,
                            req.body.startStationId, req.body.endStationId
                        ]
                    )
                });
                /* con.query(
                    `
                        INSERT INTO Ticket(
                            travelerName, travelerCategory, booking_id, seat_id,
                            departureTime, startStation_id, endStation_id
                        )
                        VALUES(?, ?, ?, ?, ?, ?, ?)
                    `,
                    [
                        req.body.travelerName, req.body.travelerCategory, rows.insertId,
                        req.body.seat_id, req.body.departureTime,
                        req.body.startStationId, req.body.endStationId
                    ]
                ) */

                res.status(200).json({ success: true, result: `Tickets inserted` });
            }
            else {
                res.status(500).json({ success: false, error: err.message });
            }
        })
        .catch((err) => {
            res.status(500).json({ success: false, error: err.message });
        });
}

module.exports = {
    postBookingAndTickets
}