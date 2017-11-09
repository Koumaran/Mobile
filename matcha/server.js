const express = require('express');   // pour générer les routes du serveur
const bodyParser = require('body-parser'); // middleware pour parser les requettes
const path = require('path');
const http = require('http');
const app = express();

// fichier API pour interragir avec MongoDB
const api = require('./server/routes/api');

// parsers
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false}));

// Angular builded DIST output folder
app.use(express.static(path.join(__dirname, 'dist')));

// API location
app.use('/api', api);

// Envoyer toute les autre requettes vers Angular App
app.get('*', (req, res) => {
  res.sendFile(path.join(__dirname, 'dist/index.html'));
});

// Set port
const port = process.env.PORT || '3000';
app.set('port', port);

const server = http.createServer(app);

server.listen(port, () => console.log('Running on localhost: ' + port));
