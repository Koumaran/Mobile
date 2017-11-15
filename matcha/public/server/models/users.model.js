// grab the things we need
var mongoose = require('mongoose');
var Schema = mongoose.Schema;

// create a schema
var usersSchema = new Schema({
  name: String,
  surname: String,
  pseudo: { type: String, required: true, unique: true },
  dateOfBrith: String,
  address: String,
  sexe: String,
  password: { type: String, required: true },
  CreateDate: { type: Date, default: Date.now}
});


// create model and make this available to our users in our Node applications
module.exports = mongoose.model('Users', usersSchema);
