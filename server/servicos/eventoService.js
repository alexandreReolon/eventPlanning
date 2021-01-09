const {
  Colorizer
} = require('logform');
const logger = require('../util/logger.js');

module.exports = function (app) {
  const conexao = app.persistencia.connection;

  app.get('/eventoService/adquirirEventos/', function (req, res) {
    logger.info("Executando o método ==> eventoService/adquirirEventos");

    const query = "select " +
      "ID_EVENTO as 'id', " +
      "BL_IMAGEM as IMAGE," +
      "TX_TITULO as title," +
      "substring(monthname(dt_inicio), 1, 3) as mes," +
      "concat(concat(hour(DT_INICIO), ':' ), minute(dt_inicio)) as 'hour'," +
      "day(DT_INICIO) as 'date' " +
      "from " +
      "tb_evento;";

    conexao.query(query, (err, result) => {
      if (err || result.affectedRows <= 0) {
        console.log(err);

        res.status(500);
        res.json({
          "message": "NÃO FOI POSSÍVEL ADQUIRIR O EVENTO"
        });
      } else {
        res.send(result);
      }
    });

  });

  app.post('/eventoService/salvarEventos/', function (req, res) {
    logger.info("Executando o método ==> eventoService/salvarEventos");

    const parameters = req.body;

    if (parameters == null || isEmpty(parameters.titulo) || isEmpty(parameters.mensagem) || isEmpty(parameters.dataInicio) || isEmpty(parameters.imagem)) {
      res.status(500)
      res.send(parameters);
      res.end();
      return false;
    }

    const event = {
      titulo: parameters.titulo,
      dataCadastro: new Date(),
      dataInicio: new Date(parameters.dataInicio),
      imagem: parameters.imagem
    }
    const query = 'INSERT INTO tb_evento (tx_titulo, dt_cadastro, dt_inicio, bl_imagem) VALUES (?, ?, ?, ?);';

    conexao.query(query, [event.titulo, event.dataCadastro, event.dataInicio, event.imagem], (err, result) => {
      if (err || result.affectedRows <= 0) {
        console.log("ERR)" + err);

        res.status(500);
        res.json({
          "message": "NÃO FOI POSSÍVEL SALVAR O EVENTO"
        });
      } else {

        conexao.query("SELECT LAST_INSERT_ID()", (err, result) => {
          if (err || result.affectedRows <= 0) {
            res.status(500);
            res.json({
              "message": "NÃO FOI POSSÍVEL SALVAR O EVENTO"
            });

          } else {

            var notification = {
              evento: result[0]["LAST_INSERT_ID()"],
              beacon: parameters.beacon,
              mensagem: parameters.mensagem
            }


            let queryNotificacao = 'INSERT INTO tb_beaconnotification (CD_BEACON, CD_EVENTO, TX_MENSAGEM) VALUES (?, ?, ?);'
            conexao.query(queryNotificacao, [notification.beacon, notification.evento, notification.mensagem], (err, result) => {

              if (err || result.affectedRows <= 0) {
                console.log(err);
                res.status(500);
                res.json({
                  "message": "NÃO FOI POSSÍVEL SALVAR O EVENTO"
                });

              } else {
                res.status(200);
                res.json({
                  "message": "EVENTO CRIADO"
                });
              }
            });
          }
        });

      }
    });

  });

}