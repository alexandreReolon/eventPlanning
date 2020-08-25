function UsuarioDAO(connection) {
    this._connection = connection;
}

UsuarioDAO.prototype.salva = function(usuario,callback) {
    this._connection.query('INSERT INTO usuario SET ?', usuario, callback);
}

UsuarioDAO.prototype.atualiza = function(usuario,callback) {
    this._connection.query('UPDATE usuario SET status = ? where id = ?', [usuario.status, usuario.id], callback);
}

UsuarioDAO.prototype.lista = function(callback) {
    this._connection.query('select * from usuario',callback);
}

UsuarioDAO.prototype.buscaPorId = function (id,callback) {
    this._connection.query("select * from usuario where id = ?",[id],callback);
}

UsuarioDAO.prototype.autenticar = function (parametros, callback) {
    this._connection.query("select * from usuario where email= ? and senha =?", [parametros.email, parametros.password], callback);
}

module.exports = function(){
    return UsuarioDAO;
};
