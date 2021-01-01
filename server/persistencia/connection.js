var mysql = require('mysql');

const conexao = mysql.createConnection({
	host: 'localhost',
	database: 'event-planning',
	user: 'root',
	password: '',
	port: '3306'
});

module.exports = conexao;