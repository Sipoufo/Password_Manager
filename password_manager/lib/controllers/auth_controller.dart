import 'package:flutter/material.dart';
import 'package:http/src/response.dart';
import 'package:password_manager/controllers/request.dart';
import 'package:password_manager/controllers/response.dart';
import 'package:password_manager/endpoints/auth.dart';
import 'package:password_manager/services/auth_service.dart';

class AuthController {
  final resultNotifier = ValueNotifier<RequestState>(RequestInitial());

  Future<void> register(String name, String email, String password) async {
    resultNotifier.value = RequestLoadInProgress();
    AuthService authService = AuthService();

    final json = '{"name": $name, "email": $email, "password": $password}';
    ResponseData responseData = ResponseData();

    responseData
        .handleResponse(authService.register(REGISTER, json) as Response);
  }
}
