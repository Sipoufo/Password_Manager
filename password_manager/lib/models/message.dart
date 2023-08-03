import 'package:password_manager/models/user.dart';

class Message {
  final bool isError;
  final User? data;
  final String message;

  Message({
    this.isError = false,
    required this.message,
    this.data,
  });
}
