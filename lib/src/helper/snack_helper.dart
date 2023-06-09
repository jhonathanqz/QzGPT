import 'package:flutter/material.dart';

class SnackHelper {
  static void showSnackInformation(
    String message,
    Color color,
    BuildContext context, {
    int seconds = 3,
  }) {
    FocusScope.of(context).requestFocus(
      FocusNode(),
    );
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(color: Colors.white, fontSize: 15),
        ),
        backgroundColor: color,
        duration: Duration(
          seconds: seconds,
        ),
      ),
    );
  }
}
