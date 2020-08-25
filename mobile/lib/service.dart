import 'dart:convert';
import 'package:http/http.dart' as http;

const BASE_URL = "http://ENDERECO:PORTA/";
const HEADERS = {'Content-type': 'application/json'};
const STATUS_CODE_SUCESS = 200;

Future get(String url, Object parameter) async {
  print("CHAMOU");

  http.Response response = await http.get(BASE_URL + url, headers: HEADERS);

  print("RESPONSE");

  if (response.statusCode == STATUS_CODE_SUCESS) {
    print("SUCESSO");
    return json.encode(response.body);
  }

  print("FALHA");

  return null;
}
