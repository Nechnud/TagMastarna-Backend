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

module.exports = {
  getStations,
};
