import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:password_manager/controllers/request.dart';

class ResponseData {
  final resultNotifier = ValueNotifier<RequestState>(RequestInitial());

  void handleResponse(Response response) {
    if (response.statusCode >= 400) {
      resultNotifier.value = RequestLoadFailure();
    } else {
      resultNotifier.value = RequestLoadSuccess(response.body);
    }
  }
}
