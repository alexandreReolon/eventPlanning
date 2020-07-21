var app = require('./config/custom-express')();
var conexao = require('./persistencia/connection');
var tabelas = require('./persistencia/Tabelas');

//Conectando na base de dados
conexao.connect(function (error) {
  if (error) {
    console.log("Erro ao se conectar com a base de dados.")
    console.log(error);
  } else{

    console.log("Conectado com sucesso.");

    //tabelas.init(conexao);

    //Starta a aplicação
  
}
});
