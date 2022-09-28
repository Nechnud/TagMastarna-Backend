require("dotenv").config({ path: `${process.cwd()}/../../.env` });
const express = require("express");
const bodyParser = require("body-parser");
const routes = require('../router');

const app = express();
const port = process.env.PORT || 4000;

app.use(express.json());
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());
app.use("/api", routes());

app.listen(port, () => {
  console.log(`App listening on port ${port}`);
});
