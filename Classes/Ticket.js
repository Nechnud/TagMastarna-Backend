module.exports = class Ticket {

    travelers = [];
    firstClass = false;

    constructor(
        arrivalDatetime, departureDatetime,
        startStationId, startStation, startStationDeparture,
        endStationId, endDestination, endStationArrival
    ) {
        this.arrivalDatetime = arrivalDatetime;
        this.departureDatetime = departureDatetime;
        this.startStationId = startStationId;
        this.startStation = startStation;
        this.startStationDeparture = startStationDeparture;
        this.endStationId = endStationId;
        this.endDestination = endDestination;
        this.endStationArrival = endStationArrival
    }

    addTraveler(name, travelerCategory, seatId) {
        this.travelers.add(
            {
                travelerName: name,
                travelerCategory: travelerCategory,
                seat_id: seatId
            }
        );
    }

    getTravelers() {
        return this.travelers;
    }

    setFirstClass(firstClass) {
        this.firstClass = firstClass;
    }

    calculatePrice() {
        // call static methods of Price class to calculate prices 
    }

}