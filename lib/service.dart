import 'dart:convert';
import 'dart:async';
import 'package:eventPlanning/constants.dart';
import 'package:eventPlanning/models/Event.dart';
import 'package:http/http.dart' as http;
import 'package:toast/toast.dart';

const BASE_URL = "https://eventplaning.herokuapp.com/";
const HEADERS = {'Content-type': 'application/json'};
const STATUS_CODE_SUCESS = 200;

Future<List<Event>> getEvento(context) async {
  const url = 'eventoService/adquirirEventos/';
  http.Response response = await http.get(BASE_URL + url, headers: HEADERS);

  if (response.statusCode == STATUS_CODE_SUCESS) {
    var body = json.decode(response.body);

    List<Event> retorno = body.map<Event>((map) {
      return Event.fromJson(map);
    }).toList();

    return retorno;
  }

  mensagemErro(response.body, context);
  return null;
}

Future<List<Event>> getEventosRealizados(context, obj) async {
  const url = 'eventoService/adquirirEventosRegistrados/';

  String parametros = obj != null ? jsonEncode(obj) : '';

  http.Response response =
      await http.post(BASE_URL + url, body: parametros, headers: HEADERS);

  if (response.statusCode == STATUS_CODE_SUCESS) {
    var body = json.decode(response.body);

    List<Event> retorno = body.map<Event>((map) {
      return Event.fromJson(map);
    }).toList();

    return retorno;
  }

  mensagemErro(response.body, context);
  return null;
}

Future<List<Event>> getEventoFavorito({context, int usuario}) async {
  const url = 'eventoService/adquirirEventosFavoritos/';

  var parametros = {
    'codigoUsuario': usuario,
  };

  http.Response response = await http.post(BASE_URL + url,
      body: jsonEncode(parametros), headers: HEADERS);

  if (response.statusCode == STATUS_CODE_SUCESS) {
    var body = json.decode(response.body);

    List<Event> retorno = body.map<Event>((map) {
      return Event.fromJson(map);
    }).toList();

    return retorno;
  }

  mensagemErro(response.body, context);
  return null;
}

Future<String> post(String url, Object parameter, context) async {
  String parametros = parameter != null ? jsonEncode(parameter) : '';

  http.Response response =
      await http.post(BASE_URL + url, body: parametros, headers: HEADERS);

  if (response.statusCode == STATUS_CODE_SUCESS) {
    var body = response.body;

    return body;
  }

  mensagemErro(response.body, context);

  return null;
}

mensagemErro(body, context) {
  Toast.show(
    body.toString(),
    context,
    duration: 6,
    gravity: Toast.TOP,
    backgroundColor: CColors.red,
  );
}
