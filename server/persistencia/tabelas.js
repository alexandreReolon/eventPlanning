const logger = require('../util/logger.js');

class Tabelas {
  init(conexao) {
    logger.info("Verificando alterações em base");
    this.conexao = conexao;

    this.criarUsuario();
    this.criarBeacons();
    this.criarEvento();
  }

  executarCarga(tabela, dados, condicao, metodo) {
    const query = "INSERT INTO " + tabela + "" +
      "SELECT	* FROM (" + dados + ") AS DADOS " +
      "WHERE NOT EXISTS (" + condicao + ");";

    this.executarQuery(query, metodo);
  }

  executarQuery(query, tabela) {
       logger.info("Executando o método ==> Tabelas/" + tabela);

       this.conexao.query(query, function (error) {
           if (error) {
               console.log(error);
               logger.error(error);
           }
       });
   }

   criarUsuario() {
       const query = "CREATE TABLE IF NOT EXISTS tb_usuario (" +
           "id_usuario int  NOT NULL AUTO_INCREMENT UNIQUE," +
           "tx_nome varchar(255) NOT NULL," +
           "tx_email varchar(255) NOT NULL UNIQUE," +
           "tx_senha varchar(50) NOT NULL," +
           "dt_cadastro timestamp NOT NULL  DEFAULT CURRENT_TIMESTAMP," +

           "CONSTRAINT PRIMARY KEY (id_usuario) );";

       this.executarQuery(query, "tb_usuario");
   }

   criarBeacons() {
       const query = "CREATE TABLE IF NOT EXISTS tb_beacon (" +
           "id_beacon int  NOT NULL AUTO_INCREMENT UNIQUE," +
           "nr_uuid varchar(255) NOT NULL UNIQUE," +
           "tx_descricao varchar(255) NOT NULL," +

           "CONSTRAINT PRIMARY KEY (id_beacon) );";

       this.executarQuery(query, "tb_beacon");
   }

   criarEvento() {
       const query = "CREATE TABLE IF NOT EXISTS tb_evento (" +
           "id_evento int  NOT NULL AUTO_INCREMENT UNIQUE," +
           "tx_titulo varchar(255) NOT NULL," +
           "dt_cadastro timestamp NOT NULL  DEFAULT CURRENT_TIMESTAMP," +
           "dt_inicio timestamp NOT NULL  DEFAULT CURRENT_TIMESTAMP," +
           "dt_fim timestamp NOT NULL  DEFAULT CURRENT_TIMESTAMP," +
           "bl_imagem timestamp NOT NULL  DEFAULT CURRENT_TIMESTAMP," +

           "CONSTRAINT PRIMARY KEY (id_evento) );";

       this.executarQuery(query, "tb_evento");
   }

   criarEvento() {
       const query = "CREATE TABLE IF NOT EXISTS tb_evento (" +
           "id_evento int  NOT NULL AUTO_INCREMENT UNIQUE," +
           "tx_titulo varchar(255) NOT NULL," +
           "dt_cadastro timestamp NOT NULL  DEFAULT CURRENT_TIMESTAMP," +
           "dt_inicio timestamp NOT NULL  DEFAULT CURRENT_TIMESTAMP," +
           "dt_fim timestamp NOT NULL  DEFAULT CURRENT_TIMESTAMP," +
           "bl_imagem MEDIUMBLOB," +

           "CONSTRAINT PRIMARY KEY (id_evento) );";

       this.executarQuery(query, "tb_evento");
   }


}


module.exports = new Tabelas;
