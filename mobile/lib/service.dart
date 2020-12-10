import 'dart:convert';
import 'dart:async';
import 'package:eventPlanning/modelos/Evento.dart';
import 'package:http/http.dart' as http;
import 'package:toast/toast.dart';

const BASE_URL = "http://192.168.1.104:8080/";
const HEADERS = {'Content-type': 'application/json'};
const STATUS_CODE_SUCESS = 200;

Future<List<dynamic>> get(String url) async {
  http.Response response = await http.get(BASE_URL + url, headers: HEADERS);

  var body = json.decode(response.body);

  if (response.statusCode == STATUS_CODE_SUCESS) {
    return body.toList();
  }
}

Future<List<Evento>> getEvento(String url) async {
  http.Response response = await http.get(BASE_URL + url, headers: HEADERS);

  var body = json.decode(response.body);

  if (response.statusCode == STATUS_CODE_SUCESS) {
    List<Evento> retorno = body.map<Evento>((map) {
      return Evento.fromJson(map);
    }).toList();

    return retorno;
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

  mensagemErro(response.body, context);
}

mensagemErro(body, context) {
  Toast.show(body.toString(), context, duration: 5, gravity: Toast.TOP);
}
