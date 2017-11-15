const express = require('express');
const router = express.Router();
const mongoose = require('mongoose');
const User = require('../models/users.model');

mongoose.Promise = require('bluebird');
mongoose.connect('mongodb://localhost:27017/matcha', { useMongoClient: true, promiseLibrary: require('bluebird') })
  .then(() =>  console.log('connection succesful'))
  .catch((err) => console.error(err));

// GET all users
router.get('/users', function (req, res) {
  User.find(function (err, user) {
    if (err) throw err;
    res.json(user);
  });
});

// GET by pseudo
router.get('/users/:pseudo', function (req, res) {
  User.findOne({ pseudo: "jega"}, function (err, user) {
    if (err) throw err;
    res.json(user);
  });
});

// SAVE user
router.post('/users', function(req, res) {
  User.create(req.body, function (err, post) {
    if (err) throw err;
    res.json(post);
  });
});

module.exports = router;
