import 'dart:convert';

import 'package:http/http.dart';
import 'package:password_manager/models/account.dart';
import 'package:password_manager/models/message.dart';
import 'package:password_manager/models/user.dart';
import 'package:password_manager/utils/local_storage.dart';

class UserService {
  Future<Message> getUserService(String urlUser) async {
    List<Account> accounts = [];

    String? idUser = await LocalStorage().setValue("idUser");
    String? token = await LocalStorage().setValue("token");

    final url = Uri.parse("$urlUser/$idUser");
    final headers = {
      "Content-type": "application/json",
      "Authorization": "Bearer $token"
    };
    final res = await get(url, headers: headers);
    if (res.statusCode != 200) {
      return Message(message: "No", isError: true);
    }
    final dataResult = jsonDecode(res.body);

    for (var i = 0; i < dataResult["accounts"].length; i++) {
      accounts.add(
        Account(
          id: dataResult["accounts"][i]["id"],
          username: dataResult["accounts"][i]["username"],
          name: dataResult["accounts"][i]["name"],
          link: dataResult["accounts"][i]["link"],
          password: dataResult["accounts"][i]["password"],
        ),
      );
    }

    User user = User(
      id: dataResult["id"],
      name: dataResult["name"],
      email: dataResult["email"],
      picture: dataResult["picture"] ?? "",
      password: dataResult["password"],
      accounts: dataResult["accounts"] == null ? <Account>[] : accounts,
    );
    return Message(message: "OK", data: user);
  }

  Future<bool> createAccountService(String urlUser, Object data) async {
    String? idUser = await LocalStorage().setValue("idUser");
    String? token = await LocalStorage().setValue("token");

    final url = Uri.parse("${urlUser}/account/${idUser}");
    print(url);
    final headers = {
      "Content-type": "application/json",
      "Authorization": "Bearer $token"
    };
    final res = await post(url, headers: headers, body: jsonEncode(data));
    if (res.statusCode != 200) {
      return false;
    }
    final dataResult = jsonDecode(res.body);
    print("Result => $dataResult");
    return true;
  }

  Future<bool> deleteAccountService(String urlUser, String data) async {
    String? idUser = await LocalStorage().setValue("idUser");
    String? token = await LocalStorage().setValue("token");

    final url = Uri.parse("${urlUser}/account/${idUser}");
    print(url);
    final headers = {
      "Content-type": "application/json",
      "Authorization": "Bearer $token"
    };
    final res = await delete(url, headers: headers, body: data);
    if (res.statusCode != 200) {
      return false;
    }
    final dataResult = jsonDecode(res.body);
    print("Result => $dataResult");
    return true;
  }

  Future<bool> updateAccountService(
      String urlUser, Object data, String idAccount) async {
    String? token = await LocalStorage().setValue("token");

    final url = Uri.parse("${urlUser}/${idAccount}");
    print(url);
    final headers = {
      "Content-type": "application/json",
      "Authorization": "Bearer $token"
    };
    print("Ready");
    final res = await put(url, headers: headers, body: jsonEncode(data));
    print("Result => $res");
    if (res.statusCode != 200) {
      return false;
    }
    return true;
  }
}
