import 'dart:convert';
import 'dart:async';
import 'package:eventPlanning/models/Event.dart';
import 'package:http/http.dart' as http;
import 'package:toast/toast.dart';

const BASE_URL = "https://eventplaning.herokuapp.com/";
const HEADERS = {'Content-type': 'application/json'};
const STATUS_CODE_SUCESS = 200;

Future<String> get(String url, Object parameter) async {
  http.Response response = await http.get(BASE_URL + url, headers: HEADERS);

  var body = json.decode(response.body);

  if (response.statusCode == STATUS_CODE_SUCESS) {
    return body;
  }
}

Future<List<Event>> getEvento(String url) async {
  http.Response response = await http.get(BASE_URL + url, headers: HEADERS);

  var body = json.decode(response.body);

  if (response.statusCode == STATUS_CODE_SUCESS) {
    List<Event> retorno = body.map<Event>((map) {
      return Event.fromJson(map);
    }).toList();

    return retorno;
  }
}

Future<String> post(String url, Object parameter, context) async {
  String parametros = parameter != null ? jsonEncode(parameter) : '';

  http.Response response =
      await http.post(BASE_URL + url, body: parametros, headers: HEADERS);

  var body = response.body;

  if (response.statusCode == STATUS_CODE_SUCESS) {
    return body;
  } else {
    // mensagemErro(response.body, context);
  }
}

mensagemErro(body, context) {
  Toast.show(body.toString(), context, duration: 5, gravity: Toast.TOP);
}
