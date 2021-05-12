const mongoose = require('mongoose');
const { PlanModel, validatePlan } = require('../models/planModel');
const express = require('express');
const router = express.Router();

router.get('/',async (req,res) => { 
    const plan = await PlanModel.find();
    try{
        res.send(plan);
    }
    catch(ex){
        for(field in ex.errors){
            res.send(ex.errors[field].message);
        }
    }
});

router.get('/:id',async (req,res) => {
    const plan = await PlanModel.findById(req.params.id);
    if (!plan) return res.status(404).send('The Scheme with the given ID was not found.');
    try{
        res.send(plan);
    }
    catch(ex){
        for(field in ex.errors){
            res.send(ex.errors[field].message);
        }
    }
});

module.exports = router;