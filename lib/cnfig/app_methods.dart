import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AppMethod {
  static void loading(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  static void tostMessage(String msg) {
    Fluttertoast.showToast(
      msg: msg,
    );
  }
}
