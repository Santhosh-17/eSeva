const mongoose = require('mongoose');
const serviceModel = require('../models/serviceModel');
const express = require('express');
const router3 = express.Router();

router3.get('/',async (req,res) => { 
    const serviceRes = await serviceModel.find();
    try{
        res.send(serviceRes);
    }
    catch(ex){
        for(field in ex.errors){
            res.send(ex.errors[field].message);
        }
    }
});

router3.get('/:id',async (req,res) => {
    const serviceRes = await serviceModel.findById(req.params.id);
    if (!serviceRes) return res.status(404).send('The Scheme with the given ID was not found.');
    try{
        res.send(serviceRes);
    }
    catch(ex){
        for(field in ex.errors){
            res.send(ex.errors[field].message);
        }
    }
});

module.exports = router3;