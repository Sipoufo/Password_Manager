import 'dart:convert';

import 'package:http/http.dart';
import 'package:password_manager/models/token.dart';
import 'package:password_manager/utils/local_storage.dart';

class AuthService {
  Future<Token> register(String urlRegister, Object data) async {
    final url = Uri.parse(urlRegister);
    final headers = {"Content-type": "application/json"};
    final res = await post(url, headers: headers, body: jsonEncode(data));
    final dataResult = jsonDecode(res.body);
    print(dataResult);
    LocalStorage().addValue("idUser", dataResult["idUser"]);
    Token token = Token(token: dataResult["token"]);
    return token;
  }

  Future<Token> login(String urlLogin, Object data) async {
    final url = Uri.parse(urlLogin);
    final headers = {"Content-type": "application/json"};
    final res = await post(url, headers: headers, body: jsonEncode(data));
    print("response => ${res.body}");
    final dataResult = jsonDecode(res.body);
    print(dataResult);
    LocalStorage().addValue("idUser", dataResult["idUser"]);
    Token token = Token(token: dataResult["token"]);
    return token;
  }
}
