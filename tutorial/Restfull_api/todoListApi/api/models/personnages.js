'use strict';
var mongoose = require('mongoose');
var Schema = mongoose.Schema;

var personnagesSchema = new Schema({
    name: String,
    game: String
  });

module.exports = mongoose.model('Personnages', personnagesSchema);