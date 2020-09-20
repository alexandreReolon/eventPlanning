// import 'dart:async';
// import 'package:sqflite/sqflite.dart';
// import 'package:ordem_services/helper/Databases.dart';

// class Item_PedidoHelper {
//   static final Item_PedidoHelper _instance = Item_PedidoHelper.internal();

//   factory Item_PedidoHelper() => _instance;

//   Item_PedidoHelper.internal();

//   Databases databases = new Databases();

//   Future close() async {
//     Database dbPerson = await databases.db;
//     dbPerson.close();
//   }
// }

// class Item_Pedido {
//   dynamic id;
//   dynamic cd_cadastro_pedido;
//   dynamic cd_servicos;

//   //inner join table
//   String Cliente;
//   String Tipo;
//   String Status;
//   String Funcionario;
//   String Marca;
//   String Modelo;
//   String Defeito;
//   String Descricao;
//   dynamic Data_Cadastrado;
//   String Servico;
//   dynamic Precos;

//   Item_Pedido(
//       {this.id,
//       this.cd_cadastro_pedido,
//       this.cd_servicos,
//       this.Cliente,
//       this.Tipo,
//       this.Status,
//       this.Funcionario,
//       this.Marca,
//       this.Modelo,
//       this.Defeito,
//       this.Descricao,
//       this.Data_Cadastrado,
//       this.Servico,
//       this.Precos});

//   factory Item_Pedido.fromJson(Map<String, dynamic> json) {
//     return Item_Pedido(
//         id: json['id'],
//         cd_cadastro_pedido: json['cd_cadastro_pedido'],
//         cd_servicos: json['cd_servicos'],
//         Cliente: json['Cliente'],
//         Tipo: json['Tipo'],
//         Status: json['Status'],
//         Funcionario: json['Funcionario'],
//         Marca: json['Marca'],
//         Modelo: json['Modelo'],
//         Defeito: json['Defeito'],
//         Descricao: json['Descricao'],
//         Data_Cadastrado: json['Data_Cadastrado'],
//         Servico: json['Servico'],
//         Precos: json['Precos']);
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['cd_cadastro_pedido'] = this.cd_cadastro_pedido;
//     data['cd_servicos'] = this.cd_servicos;
//     data['Cliente'] = this.Cliente;
//     data['Tipo'] = this.Tipo;
//     data['Status'] = this.Status;
//     data['Funcionario'] = this.Funcionario;
//     data['Marca'] = this.Marca;
//     data['Modelo'] = this.Modelo;
//     data['Defeito'] = this.Defeito;
//     data['Descricao'] = this.Descricao;
//     data['Data_Cadastrado'] = this.Data_Cadastrado;
//     data['Servico'] = this.Servico;
//     data['Precos'] = this.Precos;
//     return data;
//   }

//   @override
//   String toString() {
//     return "Item_Pedido(id: $id, cd_cadastro_pedido: $cd_cadastro_pedido, cd_servicos: $cd_servicos,Cliente: $Cliente,Tipo: $Tipo,Status: $Status,Funcionario: $Funcionario,Marca: $Marca,Modelo: $Modelo,Defeito: $Defeito,Descricao: $Descricao,Data_Cadastrado: $Data_Cadastrado, Servico: $Servico, Precos: $Precos)";
//   }
// }

//  Future<List<Funcionario>> getfuncionario() async {
//     http.Response response = await http.get(BASE_URL + 'Funcionario',
//         headers: {'token': token, 'Content-Type': 'application/json'});
//     print(response.body);
//     if (response.statusCode == 200) {
//       List<Funcionario> funcionarios =
//           json.decode(response.body).map<Funcionario>((map) {
//         return Funcionario.fromJson(map);
//       }).toList();
//       return funcionarios;
//     } else {
//       return null;
//     }
//   }

// Navigator.pushReplacement(
//      context,
//     PageTransition(
//        type: PageTransitionType.fade,
//       child: HomePage(),
//      ),
//   );

//CRON
//IMAGE MEMORY
