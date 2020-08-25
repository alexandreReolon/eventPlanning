var express = require('express');
var consign = require('consign');
var bodyParser = require('body-parser');
var expressValidator = require('express-validator');
var morgan = require('morgan');
var logger = require('../servicos/logger.js');

module.exports = function () {
  var app = express();

  app.use(morgan("common", {
    stream: {
      write: function (mensagem) {
        logger.info(mensagem);
      }
    }
  }));
  // Add headers
  app.use(function(req, res, next) {
    res.header("Access-Control-Allow-Origin", "*");
    res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
    next();
  });


  //Define a porta da applicação
  app.set('port', (8080));

  app.use(bodyParser.urlencoded({ extended: true }));
  app.use(bodyParser.json());

 app.use(expressValidator());

  consign()
    .then('persistencia')
    .then('servicos')
    .into(app);

  return app;
}
