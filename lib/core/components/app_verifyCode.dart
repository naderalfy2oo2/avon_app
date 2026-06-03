import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class AppVerifycode extends StatelessWidget {
  const AppVerifycode({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MaterialPinField(
        theme: MaterialPinTheme(
          shape: MaterialPinShape.outlined,
          borderRadius: BorderRadius.circular(8),
          //filledFillColor: Colors.green,
          //focusedBorderColor: Colors.green,
          cursorColor: Color(0xff10101038).withValues(alpha: .22),
          cursorHeight: 16,
          cursorWidth: 5,
          hintCharacter: "_",

          filledBorderColor: Colors.green,
        ),
        length: 4,

        mainAxisAlignment: MainAxisAlignment.center,

        separatorBuilder: (context, index) => SizedBox(width: 12),
      ),
    );
  }
}
