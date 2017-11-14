var express = require('express'),
app = express(),
port = process.env.PORT || 3000,
mongoose = require('mongoose'),
Task = require('./api/models/todoListModel'), //created model loading here
personnages = require('./api/models/personnages');
bodyParser = require('body-parser');

// test avec mongoClient
var MongoClient = require("mongodb").MongoClient;
MongoClient.connect("mongodb://localhost/tutoriel1", function(error, db) {
  if (error) throw error;
  if (db.collection("personnages")) {
    db.collection("personnages").drop();
    console.log("personnnages supprimer");
  }
  var objNew = [
    { name: "GLaDOS", game: "Protal"},
    { name: "GLaDOS", game: "Protal2"},
    { name: "GLaDOS", game: "Protal3"},    
  ];
  
  for (let thisObj of objNew) {
  db.collection("personnages").save(thisObj, null, function (error, results) {
    if (error) throw error;
  
    console.log("Le doc a bien été inséré");
  });
};
  
  db.collection("personnages").find().toArray(function (error, results) {
      if (error) throw error;

      results.forEach(function(obj, i) {
          console.log(
            "ID : "  + obj._id.toString() + "\nNom : " + obj.name + "\nJeu : " + obj.game                  // Half-Life: Opposing Force
          );
      });
  });
});

// fin mongoClient

// mongoose instance connection url connection
mongoose.connect('mongodb://localhost/tutoriel2', { useMongoClient: true});
mongoose.Promise = global.Promise;



app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());



var routes = require('./api/routes/todoListRoutes'); //importing route
routes(app); //register the route


// middleware for error message
app.use(function(req, res) {
    res.status(404).send({url: req.originalUrl + ' not found'})
  });

app.listen(port);


console.log('todo list RESTful API server started on: ' + port);