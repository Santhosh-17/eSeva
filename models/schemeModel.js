const mongoose = require('mongoose');

const fullModelSchema = new mongoose.Schema({
   title: {
       type: String,
       required:true,
       minlength:3,
   },
   desc: {
    type: String,
    required:true,
    minlength:4
   },
   link: {
    type: String,
    required:true
   }

});

const fullModel = mongoose.model('full-models',fullModelSchema);

module.exports = fullModel;