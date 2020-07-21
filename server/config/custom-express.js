var express = require('express');
var consign = require('consign');
var bodyParser = require('body-parser');
var morgan = require('morgan');
var logger = require('../logger/logger.js');

const http = require('http');
const https = require('https');
const fs = require('fs');

const  { check, validationResult }  = require('express-validator');

module.exports = function () {
  const credentials = {
      key: fs.readFileSync('./config/key.pem'),
      cert: fs.readFileSync('./config/cert.pem'),
      ca:fs.readFileSync('./config/ca.pem'),
      rejectUnauthorized: false ,
      headers: {
        "Access-Control-Allow-Origin": "*",
    		"Access-Control-Allow-Headers": "Origin, X-Requested-With, Content-Type, Accept"
	}
  };

  const app = express();

  app.get('/usuarioService/efetuarLogin/', (req, res) => {
   res.send('Nhaiosdjh..');
   console.log("server starting on port : " + 8443);
});

  var httpServer = http.createServer(app);
  var httpsServer = https.createServer(credentials, app);

  httpServer.listen(8080);

  httpsServer.listen(8443, () => {
    console.log("server starting on port : " + 8443)
  });

  return app;
}
