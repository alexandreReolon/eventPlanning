function userDAO(connection) {
    this._connection = connection;
}

userDAO.prototype.save = function(usuario, callback) {
    this._connection.query('INSERT INTO TB_USUARIO SET ?', usuario, callback);
}

userDAO.prototype.efetuarLogin = function(email, password) {
    this._connection.query('SELECT ID_USUARIO FROM TB_USUARIO WHERE EMAIL = '+email+' AND TX_SENHA = '+password);
}

module.exports = function(){
    return userDAO;
};
