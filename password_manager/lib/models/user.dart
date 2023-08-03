import 'package:password_manager/models/account.dart';

class User {
  String id;
  String name;
  String email;
  String password;
  String picture;
  List<Account> accounts;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.picture,
    required this.password,
    required this.accounts,
  });
}
