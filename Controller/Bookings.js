const con = require('../db/Db');
const Mailer = require('../Classes/Mailer');

const postBookingAndTickets = async (req, res) => {
    if (
        !req.body.customerId || !req.body.journeyId ||
        //!req.body.cancellationProtection) ||
        !req.body.travelers ||
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
                cancellationProtection: req.body.cancellationProtection
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
                                departureTime, startStation_id, endStation_id
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

                res.status(200).json(
                    { success: true, result: `Tickets inserted`, bookingId: rows.insertId }
                );
            }
            else {
                res.status(500).json({ success: false, error: err });
            }
        })
        .catch((err) => {
            res.status(500).json({ success: false, error: err });
        });
}

const postConfirmationEmail = (req, res) => {
    if (!req.body.email || !req.body.bookingInfo) {
        res.status(500).json({ success: false, error: 'Incorrect parameters' });
        return;
    }

    try {
        let mailer = new Mailer();
        let mailSentSuccessful = mailer.mail(req.body);
        
        if (!mailSentSuccessful) {
            res.status(500).json({ success: false, error: 'Failed to send confirmation email' });
        }
        else {
            res.status(200).json({ success: true, result: 'Booking confirmation email sent successfully' });
        }
    }
    catch(err) {
        res.status(500).json({ success: false, error: err.message });
    }

} 

module.exports = {
    postBookingAndTickets,
    postConfirmationEmail
}