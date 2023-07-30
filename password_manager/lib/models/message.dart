import 'package:flutter/material.dart';

class Message {
  final bool isError;
  final Object? data;
  final String message;

  Message({
    this.isError = false,
    required this.message,
    this.data,
  });
}
