const logger = require('../util/logger.js');

module.exports = function (app) {
  const connection = app.persistencia.connection;
  //const usuarioDao = new app.persistencia.UsuarioDAO(connection);


  app.get('/usuarioService/efetuarLogin/', function (req, res) {
    logger.info("Executando o método ==> usuarioService/efetuarLogin");

        res.send("PARABENS DEU CERTO.");
    });
}
