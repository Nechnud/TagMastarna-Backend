const http = require('http')
module.exports = class Route{
  stations;
  constructor(/*ruttid*/routeId) {

    this.routeID = routeId;
    this.getStationData();
  }
 getStationData(){
  http.get(
    `http://${process.env.API_HOST}:${process.env.PORT}${process.env.API_URL}/searchJourney/stations/${this.routeID}`,
    (resp) => {
        let data = '';
        resp.on('data', (chunk) => {
            data += chunk;
        });

        resp.on('end', () => {
          this.stations = JSON.parse(data);
          console.log(this.stations.data)
        });

        resp.on('error', (err) => {
            console.log(err.message);
        });
    }
    
   );
   }
    
  

}
