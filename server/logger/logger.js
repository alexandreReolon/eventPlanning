var winston = require('winston');
var fs = require('fs');

if(!fs.existsSync('logger')){
  fs.mkdirSync('logger');
}

module.exports = winston.createLogger({
  transports: [
    new winston.transports.File({
      level: "info",
      filename: "logger/loggerInfo.log",
      maxsize: 9999999,
      maxFiles: 100
    })
  ]
});
