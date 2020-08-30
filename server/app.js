var app = require('./config/custom-express')();
var conexao = require('./persistencia/connection');
var tabelas = require('./persistencia/Tabelas');


//Conectando na base de dados
conexao.connect(function (error) {
    if (error) {
      console.log("Erro ao se conectar com a base de dados.")
      console.log(error);
      return;
    }
    
    console.log("Conectado com sucesso.");
    tabelas.init(conexao);

    //Starta a aplicação
    var app = require('./config/custom-express')();

    app.listen(app.get('port'), () => {
        console.log("\n *** EVENT PLANNING ***");
        console.log("Servidor rodando na porta " + app.get('port') + ".");
    });
});
