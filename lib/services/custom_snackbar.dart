import 'package:flutter/material.dart';

class CustomSnackBar {
  static void showSnackBar(
      {required BuildContext context, required String message}) {
    final snackBar = SnackBar(
      content: Text(
        message,
        style: TextStyle(
            color: Colors.white,
            fontSize: MediaQuery.of(context).size.width * 0.04),
      ),
      backgroundColor: Colors.green[700],
      duration: const Duration(milliseconds: 1150),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static void failedSnackBar(
      {required BuildContext context, required String message}) {
    final snackBar = SnackBar(
      content: Text(
        message,
        style: TextStyle(
            color: Colors.white,
            fontSize: MediaQuery.of(context).size.width * 0.04),
      ),
      backgroundColor: Colors.red[700],
      duration: const Duration(milliseconds: 1150),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
