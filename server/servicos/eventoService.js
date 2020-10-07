const logger = require('../util/logger.js');

module.exports = function(app) {
  const connection = app.persistencia.connection;
  const userDAO = new app.dao.userDAO(connection);


  app.get('/eventoService/adquirirEventos/', function(req, res) {
    logger.info("Executando o método ==> eventoService/adquirirEventos");
    
    const parameters = req.body;
    res.send([{"image": "images/event.png","title": "Apresentando para Otilia","mes": "NOV","hour": "19:00","date": "17"},{"image": "images/event.png","title": "Semana academica","mes": "SET","hour": "19:00","date": "17"}, {"image": "images/event.png","title": "CHINA E TOP","mes": "SET","hour": "19:00","date": "17"}]);
  });

}
