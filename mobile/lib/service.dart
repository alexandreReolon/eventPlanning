import 'dart:convert';
import 'package:http/http.dart' as http;

const BASE_URL = "http://ENDERECO:PORTA/";
const HEADERS = {'Content-type': 'application/json'};
const STATUS_CODE_SUCESS = 200;

Future get(String url, Object parameter) async {
  http.Response response = await http.get(BASE_URL + url, headers: HEADERS);
  if (response.statusCode == STATUS_CODE_SUCESS) {
    return json.encode(response.body);
  }
  return null;
}
