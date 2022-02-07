const express = require('express');
const app = express();
const routes = require('./routes/client_routes');
const cors = require('cors');

app.use(cors({
    origin: "*"
}));
app.use(express.urlencoded({ extended: true }));
app.use(express.json());
app.use(routes);


module.exports = { app }