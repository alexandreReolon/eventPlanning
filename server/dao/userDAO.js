function userDAO(connection) {
    this._connection = connection;
}

userDAO.prototype.save = function (usuario, callback) {
    this._connection.query('INSERT INTO TB_USUARIO SET ?', usuario, callback);
}

userDAO.prototype.efetuarLogin = async function (email, password) {
    this._connection.query('SELECT ID_USUARIO FROM TB_USUARIO WHERE TX_EMAIL = "' + email + '" AND TX_SENHA = "' + password + '"', function (err, result) {
        if (err) throw err;
        return result;
    });
}

module.exports = function () {
    return userDAO;
};
