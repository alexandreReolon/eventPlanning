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
