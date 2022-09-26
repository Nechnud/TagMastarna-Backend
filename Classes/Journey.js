require('dotenv').config({ path: `${process.cwd()}/../.env` });

module.exports = class Journey {

    routes = [];
    startDestRouteIds;
    endDestRouteIds;

    /* constructor(startDestRouteIds, endDestRouteIds) {
        //this.startDestRouteIds = startDest;
        //this.endDestRouteIds = endDest;

        for (let routeId of startDestRouteIds) {
            this.routes.push(new Route(routeId.id));
        }

        for (let routeId of endDestRouteIds) {
            this.routes.push(new Route(routeId.id));
        }
    } */

    constructor() {

    }

    setStartDestRouteIds(routeIds) {
        this.startDestRouteIds = routeIds;
        console.log(this.startDestRouteIds);
        for (let routeId of this.startDestRouteIds) {
            console.log(routeId.id);
            this.routes.push(new Route(routeId.id));
        }

    }

    getStartDestRouteIds() {
        return this.startDestRouteIds;
    }

    setEndDestRouteIds(routeIds) {
        this.endDestRouteIds = routeIds;
        console.log(this.endDestRouteIds);
        for (let routeId of this.endDestRouteIds) {
            console.log(routeId.id);
            this.routes.push(new Route(routeId.id));
        }
    }

    getEndDestRouteIds() {
        return this.endDestRouteIds;
    }

}
