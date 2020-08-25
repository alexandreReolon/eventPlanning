const logger = require('./logger.js');


module.exports = function (app) {
  const connection = app.persistencia.connection;
  const usuarioDao = new app.persistencia.UsuarioDAO(connection);


  app.get('/teste/', function (req, res) {
    console.log("AQUIIIIIIII");
    res.send("PARABENS DEU CERTO.");

    });
}
