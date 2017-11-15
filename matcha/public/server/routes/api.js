const express = require('express');
const router = express.Router();
const MongoClient = require('mongoDB').MongoClient;
const ObjectID = require('mongodb').ObjectID;

// Connect
const connection = (closure) => {
  return MongoClient.connect('mongodb://localhost:27017/matcha', (err, db) => {
    if (err) return console.log(err);

    closure(db);
  });
};

// Error handling
const sendError = (err, res) => {
  response.status = 501;
  response.message = typeof err == 'object' ? err.message : err;
  res.status(501).json(response);
};

// Response handling
let response = {
  status: 200,
  data: [],
  message: null
};

// Get users
router.get('/users', (req, res) => {
  connection((db) => {
    db.collection('users')
      .find()
      .toArray()
      .then((users) => {
        response.data = users;
        res.json(response);
      })
      .catch((err) => {
        sendError(err, res);
      });
  });
});

// Create users
router.post('/users', (req, res) => {
  var newDoc = {"name": "Jegathas"};
  connection((db) => {
    db.collection('users')
      .insert(newDoc, null, function (err, res) {
        if (err) throw err;

        console.log("Le document a bien été inséré");
      });
  });
});


module.exports = router;
