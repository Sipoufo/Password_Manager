import 'package:http/http.dart';
import 'package:password_manager/models/token.dart';

class AuthService {
  Future<Token> register(String urlRegister, Object data) async {
    final url = Uri.parse(urlRegister);
    final headers = {"Content-type": "application/json"};
    final res = await post(url, headers: headers, body: data);

    Token token = Token(token: res.body);
    return token;
  }
}
