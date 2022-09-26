const http = require('http');
const Journey = require('./Journey');

let startDest = 'Lund C';
let endDest = 'Sundbyberg';

/* async function getRouteIds(url = '') {
    const response = await fetch(url, {
        method: 'GET',
        mode: 'cors',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(data)
    });
    return response.json();
} */

/* getRouteIds(
    `http://${process.env.API_HOST}:${process.env.PORT}${process.env.API_URL}/searchJourney/station/?stationName=${startDest}`
).then((data) => {
    console.log(data);
}); */

let startDestRouteIds;
let endDestRouteIds;
let journey = new Journey();

http.get(
    `http://${process.env.API_HOST}:${process.env.PORT}${process.env.API_URL}/searchJourney/station/?stationName=${startDest}`,
    (resp) => {
        let data = '';
        resp.on('data', (chunk) => {
            data += chunk;
        });

        resp.on('end', () => {
            startDestRouteIds = JSON.parse(data);
            journey.setStartDestRouteIds(startDestRouteIds.data);
        });

        resp.on('error', (err) => {
            console.log(err.message);
        });
    }
);

http.get(
    `http://${process.env.API_HOST}:${process.env.PORT}${process.env.API_URL}/searchJourney/station/?stationName=${endDest}`,
    (resp) => {
        let data = '';
        resp.on('data', async (chunk) => {
            data += chunk;
        });

        resp.on('end', async () => {
            endDestRouteIds = JSON.parse(data);
            journey.setEndDestRouteIds(endDestRouteIds.data);
        });

        resp.on('error', (err) => {
            console.log(err.message);
        });
    }
);
