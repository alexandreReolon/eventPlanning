import 'dart:convert';
import 'dart:async';
import 'package:eventPlanning/modelos/Evento.dart';
import 'package:http/http.dart' as http;
import 'package:toast/toast.dart';

const BASE_URL = "";
const HEADERS = {'Content-type': 'application/json'};
const STATUS_CODE_SUCESS = 200;

Future<List<Evento>> get(String url, Object parameter, context) async {
  http.Response response = await http.get(BASE_URL + url, headers: HEADERS);

  var body = json.decode(response.body);

  if (response.statusCode == STATUS_CODE_SUCESS) {
    List<Evento> event = body.map<Evento>((map) {
      return Evento.fromJson(map);
    }).toList();

    return event;
  } else {
    mensagemErro(body, context);
  }
}

Future<String> post(String url, Object parameter, context) async {
  String parametros = parameter != null ? jsonEncode(parameter) : '';

  http.Response response =
      await http.post(BASE_URL + url, body: parametros, headers: HEADERS);

  var body = json.encode(response.body);

  if (response.statusCode == STATUS_CODE_SUCESS) {
    return body;
  }


  mensagemErro(body, context);
}

mensagemErro(body, context) {
  Toast.show(body.toString(), context, duration: 10, gravity: Toast.TOP);
}
