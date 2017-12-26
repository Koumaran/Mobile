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
const matcha = mongoose.connect('mongodb://localhost:27017/matcha', { useMongoClient: true, promiseLibrary: require('bluebird') })
  .then((db) => {
    console.log('connection succesful to matcha');
    db.collection("users").drop((err, delOk) => {
      console.log('Collection: Users dropped');
    });
    db.createCollection("users", (err, res) => {
      console.log("Collection: Users creaed");
    });
    var myobj = [
      { pseudo: "jega", firstName: "sivanesan", lastName: "jegathas", passWord: "coco", email: "jsivanes42@gmail.com", editable: false },
      { pseudo: "kirt's", firstName: "kugathas", lastName: "kirthana", passWord: "toto", email: "tamilby94@gmail.com", editable: false }
  ];
    db.collection("users").insert(myobj, (err2, res) => {
      if (err2) throw err;
      console.log("all document inserted");
    })
  })
  .catch((err) => console.error(err));


let UserSchema = new mongoose.Schema({
  pseudo: { type: String, require: true},
  firstName: { type: String, require: true},
  lastName: { type: String, require: true},
  passWord: { type: String, required: true},
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
  User.findOne({pseudo: user.pseudo, passWord: user.passWord}, (err, user) => {
    if (err) return res.json(err);
    console.log(user);
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
