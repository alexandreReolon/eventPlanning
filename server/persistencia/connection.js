var mysql = require('mysql');

const conexao = mysql.createConnection({
	host: 'HOST',
	user: 'USER',
	port: 'PORT',
	password: 'PASSWORD',
	database: 'DATABASE',
});

module.exports = conexao;
