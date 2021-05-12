const mongoose = require('mongoose');
const fullModel = require('../models/schemeModel');
const express = require('express');
const router2 = express.Router();

router2.get('/',async (req,res) => { 
    const fullPlan = await fullModel.find();
    try{
        res.send(fullPlan);
    }
    catch(ex){
        for(field in ex.errors){
            res.send(ex.errors[field].message);
        }
    }
});

router2.get('/:id',async (req,res) => {
    const fullPlan = await fullModel.findById(req.params.id);
    if (!fullPlan) return res.status(404).send('The Scheme with the given ID was not found.');
    try{
        res.send(fullPlan);
    }
    catch(ex){
        for(field in ex.errors){
            res.send(ex.errors[field].message);
        }
    }
});

module.exports = router2;