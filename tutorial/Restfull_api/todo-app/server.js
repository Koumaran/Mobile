var express = require('express');
var app = express();
var port = process.env.PORT || 3000;
// Load mongoose package
var mongoose = require('mongoose');
var bodyParser = require('body-parser');

// Connect to MongoDB and create/use database called todoAppTest
mongoose.Promise = global.Promise;
mongoose.connect('mongodb://localhost/todoAppTest');



// Create a schema
var TodoSchema = new mongoose.Schema({
    name: String,
    completed: Boolean,
    note: String,
    updated_at: { type: Date, default: Date.now },
});

// Create a model based on the schema
var Todo = mongoose.model('Todo', TodoSchema);

app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());
// middleware for error message
app.use(function(req, res) {
    res.status(404).send({url: req.originalUrl + ' not found'})
  });
app.listen(port);

console.log('Todo-app RESTful API server started on : ' + port);