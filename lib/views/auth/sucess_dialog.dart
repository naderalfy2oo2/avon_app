import 'package:avon_app/core/components/app_button.dart';
import 'package:avon_app/core/components/app_image.dart';
import 'package:flutter/material.dart';

class SucessDialogView extends StatelessWidget {
  const SucessDialogView({super.key});

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      contentPadding: EdgeInsets.symmetric(vertical: 24, horizontal: 8),
      insetPadding: EdgeInsets.all(24),
      children: [
        AppImage(
          image: 'sucess.json',
          height: 100,
          width: 100,
          bottomSpace: 26,
        ),

        Center(
          child: Text(
            'Password Created!',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),

        SizedBox(height: 4),
        Text(
          'Congratulations! Your password\n has been successfully created',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 26),

        AppButton(text: 'Return to login', onPressed: () {}),
      ],
    );
  }
}
