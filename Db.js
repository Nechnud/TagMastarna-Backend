let mysql = require("mysql2");

let con = mysql.createConnection({
  host: "localhost",
  port: "3306",
  user: "root",
  password: "mysql",
  database: "trainmasters",
});

con.connect(function (err) {
  if (err) throw err;
  console.log("Connected!");
});

module.exports = con;
