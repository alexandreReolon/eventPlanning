import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:toast/toast.dart';

const BASE_URL = "http://192.168.1.106:8080/";
const HEADERS = {'Content-type': 'application/json'};
const STATUS_CODE_SUCESS = 200;

Future get(String url, Object parameter) async {
  http.Response response = await http.get(BASE_URL + url, headers: HEADERS);

  if (response.statusCode == STATUS_CODE_SUCESS) {
    return json.encode(response.body);
  }

  return null;
}

Future post(String url, Object parameter, context) async {
  String parametros = parameter != null ? jsonEncode(parameter) : '';

  http.Response response =
      await http.post(BASE_URL + url, body: parametros, headers: HEADERS);

  var body = json.encode(response.body);

  if (response.statusCode == STATUS_CODE_SUCESS) {
    return body;
  }

  mensagemErro(body, context);
  return null;
}

mensagemErro(body, context) {
  Toast.show(body, context, duration: 3, gravity: Toast.TOP);

  return null;
}
