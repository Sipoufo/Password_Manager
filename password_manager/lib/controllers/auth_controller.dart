import 'package:password_manager/endpoints/auth.dart';
import 'package:password_manager/models/token.dart';
import 'package:password_manager/services/auth_service.dart';

class AuthController {
  Future<Token> register(String email, String name, String password) async {
    print(email);
    AuthService authService = AuthService();
    final json = {"email": email, "name": name, "password": password};

    return await authService.register(REGISTER, json);
  }

  Future<Token> login(String email, String password) async {
    AuthService authService = AuthService();
    print("email $email");
    final json = {"email": email, "password": password};

    print("json $json");
    return await authService.login(LOGIN, json);
  }
}
