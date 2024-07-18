import dotenv from 'dotenv';
dotenv.config();
//require('dotenv').config();
const express = require('express');

const app = express();
const PORT = process.env.PORT || 3000;
const nodeEnv = process.env.NODE_ENV || 'development';

app.use(express.static('../client/dist'));
app.use(express.urlencoded({ extended: true }));
app.use(express.json());

require('./routes/htmlRoutes')(app);

app.listen(PORT, () => console.log(`Now listening on port: ${PORT}`));
