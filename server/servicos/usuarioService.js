const logger = require('../util/logger.js');

module.exports = function (app) {
  const conexao = app.persistencia.connection;

  isEmpty = function (string) {
    return string == null || string == '';
  }

  app.post('/usuarioService/efetuarLogin/', function (req, res) {
    logger.info("Executando o método ==> usuarioService/efetuarLogin");
    const parameters = req.body;

    if (parameters == null || isEmpty(parameters.email) || isEmpty(parameters.password)) {
      res.status(500)
      res.send('PREENCHA TODOS OS CAMPOS PARA CONTINUAR');
      res.end();
      return false;
    }

    try {
      conexao.query('SELECT ID_USUARIO FROM TB_USUARIO WHERE TX_EMAIL = "' + parameters.email + '" AND TX_SENHA = "' + parameters.password + '"', function (err, result) {
        if (err) throw err;

        if (!isEmpty(result[0]) && result[0].ID_USUARIO > 0) {
          res.send(result[0].ID_USUARIO.toString());
          res.end();

        } else {
          res.status(500);
          res.send('EMAIL OU SENHA NÃO CONFEREM, VERIFIQUE E TENTE NOVAMENTE!');
          res.end();
        }
      });

    } catch (e) {
      console.log(e)
      res.status(500);
      res.send('EMAIL OU SENHA NÃO CONFEREM, VERIFIQUE E TENTE NOVAMENTE!');
      res.end();
    }

  });

  app.post('/usuarioService/cadastrarUsuario/', function (req, res) {
    logger.info("Executando o método ==> usuarioService/cadastrarUsuario");

    const parameters = req.body;
    const userModel = {
      'tx_nome': parameters.name,
      'tx_email': parameters.email,
      'tx_senha': parameters.password,
      'dt_cadastro': new Date()
    };


    if (userModel.tx_nome == null || userModel.tx_email == null || userModel.tx_senha == null) {
      res.status(501).end();
      res.send("PARAMETROS NÃO PODE SER NULLOs");
      return false;
    }

    const query = 'INSERT INTO TB_USUARIO (tx_nome, tx_email, tx_senha, dt_cadastro) VALUES (?, ?, ?, ?);';

    conexao.query(query, [userModel.tx_nome, userModel.tx_email, userModel.tx_senha, userModel.dt_cadastro], function (error, result) {
      if (error) throw error;

      res.status(200);
      res.send("");
    });
  });

}