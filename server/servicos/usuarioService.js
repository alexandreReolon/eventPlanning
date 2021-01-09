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

    const query = 'SELECT ID_USUARIO, CD_TIPOUSUARIO FROM tb_usuario WHERE TX_EMAIL = "' + parameters.email + '" AND TX_SENHA = "' + parameters.password + '"';

    const falha = function () {
      res.status(500);
      res.send('EMAIL OU SENHA NÃO CONFEREM, VERIFIQUE E TENTE NOVAMENTE!');
      res.end();
    }

    const retorno = function (err, result) {
      if (err) throw err;

      if (!isEmpty(result[0])) {

        var parametros = {
          'codigoUsuario': result[0].ID_USUARIO,
          'codigoTipoUsuario': result[0].CD_TIPOUSUARIO
        }

        res.send(JSON.stringify(parametros));
        res.end();

      } else {
        falha();
      }
    }

    try {
      conexao.query(query, retorno);

    } catch (e) {
      console.log(e)
      falha();
    }

  });

  app.post('/usuarioService/cadastrarUsuario/', function (req, res) {
    logger.info("Executando o método ==> usuarioService/cadastrarUsuario");

    const parameters = req.body;
    const userModel = {
      'tx_nome': parameters.name,
      'tx_email': parameters.email,
      'tx_senha': parameters.password,
      'dt_cadastro': new Date(),
      'codigoTipoUsuario': 2,
    };


    if (userModel.tx_nome == null || userModel.tx_email == null || userModel.tx_senha == null) {
      res.status(501).end();
      res.send("PARAMETROS NÃO PODE SER NULLOs");
      return false;
    }

    const query = 'INSERT INTO tb_usuario (tx_nome, tx_email, tx_senha, dt_cadastro, cd_tipousuario) VALUES (?, ?, ?, ?, ?);';

    const funcao = function (error, result) {
      if (error) throw error;

      res.status(200);
      res.send("");
    }

    conexao.query(query, [userModel.tx_nome, userModel.tx_email, userModel.tx_senha, userModel.dt_cadastro, userModel.codigoTipoUsuario], funcao);
  });

}