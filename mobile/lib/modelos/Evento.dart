import 'dart:developer';

class Evento {
  dynamic id;

  String image;
  String title;
  String hour;
  String mes;
  String date;

  Evento({
    this.id,
    this.image,
    this.hour,
    this.title,
    this.mes,
    this.date,
  });

  factory Evento.fromJson(Map<String, dynamic> json) {
    return Evento(
      id: json['id'],
      hour: json['hour'],
      title: json['title'],
      image: json['image'],
      mes: json['mes'],
      date: json['date'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['id'] = this.id;
    data['hour'] = this.hour;
    data['title'] = this.title;
    data['image'] = this.image;
    data['mes'] = this.mes;
    data['date'] = this.date;

    return data;
  }
}

// Future<List<Funcionario>> getfuncionario() async {
//   http.Response response = await http.get(BASE_URL + 'Funcionario',
//       headers: {'token': token, 'Content-Type': 'application/json'});
//   print(response.body);
//   if (response.statusCode == 200) {
//     List<Funcionario> funcionarios =
//         json.decode(response.body).map<Funcionario>((map) {
//       return Funcionario.fromJson(map);
//     }).toList();
//     return funcionarios;
//   } else {
//     return null;
//   }
// }

// Navigator.pushReplacement(
//      context,
//     PageTransition(
//        type: PageTransitionType.fade,
//       child: HomePage(),
//      ),
//   );

//CRON
//IMAGE MEMORY
