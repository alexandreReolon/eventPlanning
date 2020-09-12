var app = require('./config/custom-express')();
var connection = require('./persistencia/connection');
var tables = require('./persistencia/Tabelas');


//Conectando na base de dados
connection.connect(function (error) {
    if (error) {
      console.log("Erro ao se conectar com a base de dados.")
      console.log(error);
      return;
    }

    console.log("Conectado com sucesso.");
    tables.init(connection);

    //Starta a aplicação
    const app = require('./config/custom-express')();
    const port = app.get('port');

    app.listen(port, () => {
        console.log("\n *** EVENT PLANNING ***");
        console.log("Servidor rodando na porta " + port + ".");
    });
});
