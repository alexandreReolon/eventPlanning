const logger = require('../logger/logger.js');

class Tabelas {
    init(conexao) {
        console.log("Criando as tabelas do banco de dados.");
        this.conexao = conexao;
    }

    executarCarga(tabela, dados, condicao, metodo) {
        const query = "insert into " + tabela + "" +
            "select	* from (" + dados + ") as dados " +
            "where not exists (" + condicao + ");" ;

         this.executarQuery(query, metodo);
    }
}
