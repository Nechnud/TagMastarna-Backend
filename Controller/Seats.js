const con = require('../db/Db');

const getSeatsForJourney = async (req, res) => {
    con.
        promise()
        .query(
            `
                SELECT seat.id AS "seatId", trainset.id, depFromFirstStationTime, handicap, seatNumber 
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
                return res.json({ success: true, data: rows });
            }
            else {
                return res.json({ msg: err.message });
            }
        })
        .catch((err) => {
            res.status(500).json({ success: false, error: err.message });
        });
}

const getAvailableSeats = async (req, res) => {
    if (
        //!req.params.id || !req.body.startStationId || !req.body.endStationId ||
        //!req.body.startStationDeparture || !req.body.endStationArrival
        //!req.params.startStationDeparture || !req.params.endStationArrival ||
        !req.params.id || !req.query.departure || !req.query.arrival
    ) {
        res.status(200).json({ success: false, error: 'Incorrect parameters' });
        return;
    }

    con
        .promise()
        .query(
            `
                WITH start_station_arrival AS(
                    SELECT station.id, station.arrival AS "startArrival", seat_id
                    FROM journey, station, ticket, booking
                    WHERE station.id = ticket.startStartion_id 
                    AND journey.id = booking.journey_id
                    AND booking.id = ticket.booking_id
                    AND journey.id = ?
                ),
                end_station_arrival AS(
                    SELECT station.id, station.arrival AS "endArrival", seat_id
                    FROM journey, station, ticket, booking
                    WHERE station.id = ticket.endStation_id
                    AND journey.id = booking.journey_id
                    AND booking.id = ticket.booking_id
                    AND journey.id = ?
                ),
                seats_booked AS(
                    SELECT DISTINCT ticket.startStartion_id, ticket.endStation_id, ticket.departureTime,
                        seat.id AS "seatId", start_station_arrival.startArrival, end_station_arrival.endArrival
                    FROM journey, booking, ticket, seat, station, start_station_arrival, end_station_arrival
                    WHERE journey.id = ?
                    AND journey.id = booking.journey_id
                    AND booking.id = ticket.booking_id
                    AND seat.id = ticket.seat_id
                    AND seat.id = start_station_arrival.seat_id
                    AND seat.id = end_station_arrival.seat_id
                    AND seat.id IN (ticket.seat_id, start_station_arrival.seat_id, end_station_arrival.seat_id)
                    AND station.id IN (ticket.startStartion_id, ticket.endStation_id)
                    AND start_station_arrival.id = ticket.startStartion_id
                    AND end_station_arrival.id = ticket.endStation_id
                ),
                seats_free AS(
                    SELECT DISTINCT journey.id AS journeyId, journey.route_id,
                        seat.id AS "seatId", seat.seatNumber, seat.handicap, 
                        trainset.id AS trainsetId, 
                        carriage.id AS carriageId
                    FROM journey, trainset, carriage, seat
                    WHERE journey.id = ?
                    AND trainset.id = journey.trainSet_id
                    AND trainset.id = carriage.trainSet_id
                    AND carriage.id = seat.carriage_id
                    AND seat.id NOT IN(
                        SELECT seatId
                        FROM seats_booked
                        WHERE startArrival <= ?
                        AND startArrival < ?
                        AND endArrival > ?
                        OR startArrival < ?
                        AND endArrival > ?
                        OR startArrival >= ?
                        AND startArrival < ?
                    )
                )
                SELECT *
                FROM seats_free
                ORDER BY seatId
            `,
            [
                req.params.id, req.params.id,
                req.params.id, req.params.id,
                /* req.body.startStationDeparture,
                req.body.endStationArrival,
                req.body.startStationDeparture,
                req.body.endStationArrival,
                req.body.endStationArrival,
                req.body.startStationDeparture,
                req.body.endStationArrival, */
                req.query.departure,
                req.query.arrival,
                req.query.departure,
                req.query.arrival,
                req.query.arrival,
                req.query.departure,
                req.query.arrival
            ]
        )
        .then(([rows, fields, err]) => {
            if (!err) {
                data = {
                    numOfFreeSeats: rows.length,
                    seats: rows
                };
                return res.json({ success: true, data: data });
            }
            else {
                return res.json({ success: false, error: err.message });
            }
        })
        .catch((err) => {
            res.status(500).json({ success: false, error: err.message });
        });
}

module.exports = {
    getSeatsForJourney,
    getAvailableSeats
}