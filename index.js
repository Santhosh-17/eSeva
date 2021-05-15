const mongoose = require('mongoose');
const result = require('dotenv').config();
const joi = require('joi');
const plan = require('./routes/plans');
const fullPlan = require('./routes/fullPlans');
const serviceRoutes = require('./routes/service');
// const fullModel = require('./models/schemeModel');
// const data = require('./data/fullDataPlan');
// const serviceModel = require('./models/serviceModel');
// const data = require('./data/servicesData');
const express = require('express');
const app = express();

mongoose.connect(process.env.DB_SERVER,{useNewUrlParser: true, useUnifiedTopology: true})
.then(() => console.log('Connected to MongoDb...'))
.catch(() => console.log('Unable to Connect to mongoDb...',err));

app.use(express.json());
app.use('/api/plans',plan);
app.use('/api/full-plans',fullPlan);
app.use('/api/service',serviceRoutes);

const port = process.env.PORT;
app.listen(port, async () => {
    console.log(`Listening on port ${port}...`);
//    await fullModel.insertMany(data);
//    await serviceModel.insertMany(data);
}
);