const mongoose = require('mongoose');
const Joi = require('joi');

const planSchema = new mongoose.Schema({
   title: {
       type: String,
       required:true,
       minlength:3,
   },
   benefits: {
    type: String,
    required:true,
    minlength:10
   },
   eligibility:{
       description : { type: String, required:true },
       minage: { type: String, required: true },
       maxage: { type: String, required: true }
   },
   applicationprocess: {
    type: String,
    required:true,
    minlength:10
   },
   timeline: {
    type: String,
    required:true,
    minlength:4
   },
   schemeapplicationlink: {
    type: String,
    required:true,
    minlength:10
   }

});

const Plan = mongoose.model('govt-plans',planSchema);


function validatePlan(plan) {
    const schema = Joi.object({
        title: Joi.string().min(3).required(),
        benefits: Joi.string().min(10).required(),
        eligibility: Joi.object({
            description: Joi.string().trim().required(),
            minage: Joi.string().trim().required(),
            maxage: Joi.string().trim().required()
        }),
        applicationprocess: Joi.string().min(10).trim().required(),
        timeline: Joi.string().trim(),
        schemeapplicationlink: Joi.string().trim().required()
    });

    return schema.validate(plan);
}

module.exports.PlanModel = Plan;
module.exports.validatePlan = validatePlan;