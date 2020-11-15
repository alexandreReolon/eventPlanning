var mysql = require('mysql');

const conexao = mysql.createConnection({
	host: 'localhost',
	database: 'event-planning',
	user: 'root',
	password: 'root',
	port: '3306'
});

module.exports = conexao;