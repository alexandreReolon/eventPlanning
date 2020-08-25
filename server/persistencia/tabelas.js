const logger = require('../servicos/logger.js');

class Tabelas {
    init(conexao) {
        console.log("Criando as tabelas do banco de dados.")
        this.conexao = conexao;
    }

}


module.exports = new Tabelas;
