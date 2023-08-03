import 'package:password_manager/endpoints/user.dart';
import 'package:password_manager/models/message.dart';
import 'package:password_manager/services/user_service.dart';

class UserController {
  Future<Message> getUserController() async {
    UserService userService = UserService();
    print("Je passe");
    return await userService.getUserService(USER_URL);
  }

  Future<bool> createAccountController(
      String name, String link, String username, String password) async {
    UserService userService = UserService();

    final data = {
      "name": name,
      "link": link,
      "username": username,
      "password": password
    };
    print("data => $data");
    return await userService.createAccountService(USER_URL, data);
  }

  Future<bool> deleteAccountController(String idAccount) async {
    UserService userService = UserService();
    return await userService.deleteAccountService(USER_URL, idAccount);
  }

  Future<bool> updateAccountController(String name, String link,
      String username, String password, String idAccount) async {
    UserService userService = UserService();

    final data = {
      "name": name,
      "link": link,
      "username": username,
      "password": password
    };
    return await userService.updateAccountService(ACCOUNT_URL, data, idAccount);
  }
}

// String name, String link, String username, String password
