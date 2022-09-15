const express = require("express");
const app = express();
const cors = require("cors");
const port = process.env.PORT || 4000;
const routes = require("../Router/router.js/routes.js.js.js.js");

let bodyParser = require("body-parser");
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());

require("dotenv").config();
app.use("/api", routes());

app.use(express.json());
app.use(cors());

app.listen(port, () => {
  console.log(`App listening on port ${port}`, routes);
});
