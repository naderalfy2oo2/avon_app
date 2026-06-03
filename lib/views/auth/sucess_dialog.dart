import 'package:avon_app/core/components/app_button.dart';
import 'package:avon_app/core/components/app_image.dart';
import 'package:avon_app/core/components/helper_methods.dart';
import 'package:avon_app/views/auth/login.dart';
import 'package:flutter/material.dart';

class SucessDialogView extends StatelessWidget {
  final bool isFormCreateAccount;
  const SucessDialogView({super.key, this.isFormCreateAccount = false});

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
            isFormCreateAccount ? "Account Activated!" : 'Password Created!',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),

        SizedBox(height: 4),
        Text(
          isFormCreateAccount
              ? "Congratulations! Your account has been successfully activated"
              : 'Congratulations! Your password\n has been successfully created',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 26),

        AppButton(
          text: isFormCreateAccount ? "Go to home" : 'Return to login',
          onPressed: () {
            goTo(page: LoginView());
          },
        ),
      ],
    );
  }
}
