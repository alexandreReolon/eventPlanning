const logger = require('../logger/logger.js');


module.exports = function (app) {
    const connection = app.persistencia.connection;
    const pedidoDAO = app.persistencia.PedidoDAO(connection);


    app.get('/usuarioService/efetuarLogin/', function (req, res) {
        console.log("Executando o método => Listagem. ");

        pedidoDAO.lista(function (erro, resultado) {
            if (erro) {
                res.status(500).send(erro);
                return;
            }

            res.send(resultado);
        })
    });
}
