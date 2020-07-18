function PedidoDAO(connection) {
    this._connection = connection;
}

PedidoDAO.prototype.lista = function(callback){
    this._connection.query('select * from pedido inner join pedido_item on pedido_item.cdpedido = pedido.idpedido inner join produto on produto.idproduto = pedido_item.cdproduto inner join usuario on usuario.idusuario = pedido.cdusuario where usuario.cdtipousuario = 3 ',callback)
}


module.exports = function(){
    return PedidoDAO;
};
