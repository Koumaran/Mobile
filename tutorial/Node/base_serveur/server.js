
/**
 * Fichier pour créer le serveur Web embarquer en node.js
 * Methode Express
 */

var express = require("express");
var app = express();

/* Route / (index) */
app.get("/", function(req, res) {
    res.sendFile(__dirname+'/index.html');
});

/* Route /status */
app.get("/status", function(req,res) {
    res.send("OK");
});

/* Route ERROR */
app.use(function(req, res, next){
    res.setHeader('Content-Type', 'text/plain');
    res.send(404, 'Page introuvable !');
});

var port = 8080;
app.listen(port, function() {
    console.log("Express Node.js server running on port 8080.");
});