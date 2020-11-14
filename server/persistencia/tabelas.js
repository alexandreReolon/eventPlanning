const logger = require('../util/logger.js');

class Tabelas {
    init(conexao) {
        logger.info("Verificando alterações em base");
        this.conexao = conexao;

        this.executarLinguagem();

        this.criarUsuario();
        this.criarBeacons();
        this.criarEvento();
        this.cargasBeacon();
        this.criarBeaconNotificacao();
        this.criarEventoAuditoria();

    }

    executarCarga(tabela, dados, condicao, metodo) {
        const query = "INSERT INTO " + tabela + " " +
            " SELECT	* FROM (" + dados + ") AS DADOS " +
            " WHERE NOT EXISTS (" + condicao + ");";

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

    executarLinguagem() {
        const query = "SET lc_time_names = 'pt_BR'";
        this.executarQuery(query, "executarLinguagem");
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

    cargasBeacon() {
        const tabela = "tb_beacon (nr_uuid, tx_descricao) ";
        let dados = " SELECT 'fda50693-a4e2-4fb1-afcf-c6eb07647825' AS nr_uuid, 'BEACON AZUL' AS tx_descricao ";
        let condicao = " SELECT 1 FROM TB_BEACON WHERE TX_DESCRICAO LIKE 'BEACON AZUL'";
        this.executarCarga(tabela, dados, condicao, "cargasBeacon");


        dados = "SELECT 'fda50693-a4e2-4fb1-afcf-c6eb0764782' AS nr_uuid, 'BEACON BRANCO' AS tx_descricao ";
        condicao = "SELECT 1 FROM TB_BEACON WHERE TX_DESCRICAO LIKE 'BEACON BRANCO' ";

        this.executarCarga(tabela, dados, condicao, "cargasBeacon");
    }

    criarEvento() {
        const query = "CREATE TABLE IF NOT EXISTS tb_evento (" +
            "id_evento int  NOT NULL AUTO_INCREMENT UNIQUE," +
            "tx_titulo varchar(255) NOT NULL," +
            "dt_cadastro timestamp NOT NULL  DEFAULT CURRENT_TIMESTAMP," +
            "dt_inicio timestamp NOT NULL  DEFAULT CURRENT_TIMESTAMP," +
            "bl_imagem timestamp NOT NULL  DEFAULT CURRENT_TIMESTAMP," +

            "CONSTRAINT PRIMARY KEY (id_evento) );";

        this.executarQuery(query, "tb_evento");
    }

    criarBeaconNotificacao() {
        const query = "CREATE TABLE IF NOT EXISTS tb_beaconnotification (" +
            "id_beaconnotification int  NOT NULL AUTO_INCREMENT UNIQUE," +
            "cd_beacon int NOT NULL," +
            "cd_evento int NOT NULL," +
            "tx_mensagem varchar(255) NOT NULL," +

            "CONSTRAINT PRIMARY KEY (id_beaconnotification)," +
            "CONSTRAINT beaconnot_evento_fk FOREIGN KEY (cd_evento) REFERENCES tb_evento (id_evento)," +
            "CONSTRAINT beaconnot_beacon_fk FOREIGN KEY (cd_beacon) REFERENCES tb_beacon (id_beacon));";

        this.executarQuery(query, "tb_beaconnotification");
    }

    criarEventoAuditoria() {
        const query = "CREATE TABLE IF NOT EXISTS tb_eventoauditoria (" +
            "id_eventoauditoria int  NOT NULL AUTO_INCREMENT UNIQUE," +
            "cd_evento int NOT NULL," +
            "cd_usuario int NOT NULL," +
            "dt_entrada timestamp NOT NULL  DEFAULT CURRENT_TIMESTAMP," +
            "dt_saida timestamp DEFAULT CURRENT_TIMESTAMP," +

            "CONSTRAINT PRIMARY KEY (id_eventoauditoria)," +
            "CONSTRAINT eventoaud_evento_fk FOREIGN KEY (cd_evento) REFERENCES tb_evento (id_evento)," +
            "CONSTRAINT eventoaud_usuario_fk FOREIGN KEY (cd_usuario) REFERENCES tb_usuario (id_usuario));";

        this.executarQuery(query, "tb_eventoauditoria");
    }


}


module.exports = new Tabelas;
