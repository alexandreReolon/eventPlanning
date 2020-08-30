var winston = require('winston');
var fs = require('fs');

//Cria o diretorio logs
if(!fs.existsSync('logs')){
  fs.mkdirSync('logs');
}

//Propriedades do logger
const logger = winston.createLogger({
  level: 'info',
  format: winston.format.json(),
  defaultMeta: { service: 'user-service' },
  transports: [
    new winston.transports.File({ filename: 'logs/server.log' }),
  ],
});

//Starta o logger
if (process.env.NODE_ENV !== 'production') {
  logger.add(new winston.transports.Console({
    format: winston.format.simple(),
  }));
}

module.exports = logger;
