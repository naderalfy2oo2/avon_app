import 'package:avon_app/core/components/app_image.dart';
import 'package:flutter/material.dart';

class AppInput extends StatelessWidget {
  final String? suffixIcon, hint;
  const AppInput({super.key, this.suffixIcon, this.hint});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hint,
        isDense: true,

        suffixIcon: suffixIcon != null
            ? AppImage(image: suffixIcon!, height: 18, width: 18)
            : null,
      ),
    );
  }
}
