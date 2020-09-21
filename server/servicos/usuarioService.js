const logger = require('../util/logger.js');

module.exports = function(app) {
  const connection = app.persistencia.connection;
  const userDAO = new app.dao.userDAO(connection);


  app.get('/usuarioService/efetuarLogin/', function(req, res) {
    logger.info("Executando o método ==> usuarioService/efetuarLogin");
    const parameters = req.body;

    if (parameters.email == null || parameters.password == null) {
      res.status(501).end();
      res.send("PARAMETROS NÃO PODE SER NULLOs");
      return false;
    }

    try {
      const cod = userDAO.efetuarLogin(parameters.email, parameters.password);
      res.send(cod);

    } catch (e) {
      res.status(500).end();
      res.send("EMAIL OU SENHA NÃO CONFEREM, VERIFIQUE E TENTE NOVAMENTE!");
    }
  });

  app.post('/usuarioService/cadastrarUsuario/', function(req, res) {
    logger.info("Executando o método ==> usuarioService/cadastrarUsuario");

    const parameters = req.body;
    const userModel = {
      'tx_nome': parameters.name,
      'tx_email': parameters.email,
      'tx_senha': parameters.password,
      'dt_cadastro': Date.now()
    };


    if (userModel.tx_nome == null || userModel.tx_email == null || userModel.tx_senha == null) {
      res.status(501).end();
      res.send("PARAMETROS NÃO PODE SER NULLOs");
      return false;
    }

    userDAO.save(userModel, function(error, result) {
      if (error != null) {
        res.status(500);
        res.send("NÃO FOI POSSÍVEL SALVAR O USUÁRIO");
        return;

      } else {
        res.status(200);
        res.send("");
      }
    });
  });

}
