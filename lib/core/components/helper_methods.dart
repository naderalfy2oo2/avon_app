import 'package:flutter/material.dart';

final navKey = GlobalKey<NavigatorState>();

void goTo({required Widget page}) {
  navKey.currentState?.push(MaterialPageRoute(builder: (_) => page));
}
