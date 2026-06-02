import 'package:avon_app/views/auth/sucess_dialog.dart';
import 'package:flutter/material.dart';

import '../../core/components/app_button.dart';
import '../../core/components/app_image.dart';
import '../../core/components/app_input.dart';

class NewPasswordView extends StatelessWidget {
  const NewPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(14).copyWith(top: 48),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AppImage(image: 'splash.png', height: 64, width: 64),

              SizedBox(height: 24),
              Center(
                child: Text(
                  "Create Password",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),

              SizedBox(height: 40),

              Center(
                child: Text(
                  "The password should have at least\n 6 characters.",
                  style: TextStyle(fontSize: 14, color: Color(0xff8E8EA9)),
                  textAlign: TextAlign.center,
                ),
              ),

              SizedBox(height: 24),
              AppInput(label: 'New password', isPassword: true, bottomSpace: 0),

              SizedBox(height: 16),

              AppInput(
                label: 'Confirm password',
                isPassword: true,
                bottomSpace: 70,
              ),

              AppButton(
                text: 'Confirm',
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => SucessDialogView(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
