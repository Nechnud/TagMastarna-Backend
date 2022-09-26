const con = require("../db/Db");

const getStations = async (req, res) => {
  con
    .promise()
    .query("SELECT * FROM Station")
    .then(([rows, fields, err]) => {
      if (!err) {
        stationsList = rows;
        return res.json(stationsList);
      } else {
        return res.json({ msg: err.message });
      }
    })
    .catch((err) => {
      res.status(500).json({ success: false, error: err.message });
    });
  };
  
  
  
  const getStationsForRoute = async (req, res) => {
    if (!req.params.id) {
      res.status(500).json({ success: false, error: 'Incorrect parameters' });
      return;
    }
    
    con
    .promise()
    .query(
      `
      SELECT 
      Routes.id, 
      Station.arrival, Station.departure, Station.route_id,
      Station.stationName
      FROM routes, station
      WHERE station.route_id = routes.id
      AND routes.id = ?
      `,
      [req.params.id]
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
      getStations,
      getStationsForRoute
    };