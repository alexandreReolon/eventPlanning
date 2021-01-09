function userDAO(connection) {
    this._connection = connection;
}

userDAO.prototype.save = function (usuario, callback) {
    this._connection.query('INSERT INTO tb_usuario SET ?', usuario, callback);
}

userDAO.prototype.efetuarLogin = async function (email, password) {
    this._connection.query('SELECT ID_USUARIO FROM tb_usuario WHERE TX_EMAIL = "' + email + '" AND TX_SENHA = "' + password + '"', function (err, result) {
        if (err) throw err;
        return result;
    });
}

module.exports = function () {
    return userDAO;
};
