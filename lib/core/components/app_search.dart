import 'package:avon_app/core/components/app_input.dart';
import 'package:flutter/material.dart';

class AppSearch extends StatelessWidget {
  const AppSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return AppInput(hint: "Search", suffixIcon: 'search.jpg');
  }
}
