// Express
const express = require('express');
const app = express();
const path = require('path');

// Morgan (debuggeur)
let morgan = require('morgan');
app.use(morgan('dev'));

// Mongo Database
const mongoose = require('mongoose');
mongoose.Promise = require('bluebird');
mongoose.connect('mongodb://localhost:27017/matcha', { useMongoClient: true, promiseLibrary: require('bluebird') })
  .then(() =>  console.log('connection succesful to matcha'))
  .catch((err) => console.error(err));

let UserSchema = new mongoose.Schema({
  pseudo: { type: String, require: true},
  first_name: { type: String, require: true},
  last_name: { type: String, require: true},
  password: { type: String, required: true},
  email: { type: String, require: true},
  editable: { type: Boolean, require: true},
});
mongoose.model("User", UserSchema);
let User = mongoose.model("User");



// Body Parser
let bodyParser = require('body-parser');
app.use(bodyParser.urlencoded({extended: true}));
app.use(bodyParser.json());

// Static Folder
app.use(express.static(__dirname + '/public/dist'));


// Routes

// Get Users
app.get("/users/", (req, res, next) => {
  console.log("Server > GET '/users' ");
  User.find({}, (err, users)=>{
      return res.json(users);
  })
})

app.post("/users/:pseudo", (req, res, next) => {
  console.log("Server > POST '/users' > pseudo =  ", req.body);
  const user = req.body;
  User.findOne({pseudo: user.pseudo, password: user.password}, (err, user) => {
    if (err) return res.json(err);
    return res.json(user);
  })
})

// Create User
app.post("/users/:id", (req, res, next) => {
  console.log("Server > POST '/users' > user ", req.body);
  delete req.body._id;
  User.create(req.body, (err, user)=>{
      if (err) return res.json(err)
      else return res.json(user)
  })
})
// Destroy User
app.delete("/users/:id", (req, res, next) => {
  console.log("Server > DELETE '/users/:id' > id ", req.params.id);
  User.deleteOne({_id:req.params.id}, (err, rawData)=>{
      if (err) return res.json(err)
      else return res.json(true)
  })
})
// Update User
app.put("/users/:id", (req, res, next) => {
  console.log("Server > PUT '/users/:id' > id ", req.params.id);
  console.log("Server > PUT '/users/:id' > user ", req.body);
  User.update({_id:req.params.id}, req.body, (err, rawData)=>{
      if (err) return res.json(err)
      else return res.json(true)
  })

})


app.all('*', (req, res, next) => {
  res.sendFile(path.resolve('./public/dist/index.html'));
})

// Listen
app.listen(3000, () => console.log('Server running on 3000'));
