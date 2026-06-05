import 'package:flutter/material.dart';

final navKey = GlobalKey<NavigatorState>();

void goTo({required Widget page}) {
  navKey.currentState?.push(MaterialPageRoute(builder: (_) => page));
}

void showMsg(String msg, {bool isError = false}) {
  if (msg != null && msg.isNotEmpty) {
    ScaffoldMessenger.of(navKey.currentContext!).showSnackBar(
      SnackBar(
        backgroundColor: isError ? Colors.red : Colors.green,
        content: Text(msg),
        duration: Duration(seconds: 5),
      ),
    );
  }
}
