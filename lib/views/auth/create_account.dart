import 'package:flutter/material.dart';

import '../../core/components/app_button.dart';
import '../../core/components/app_image.dart';
import '../../core/components/app_input.dart';
import '../../core/components/app_login_or_register.dart';

class CreateAccountView extends StatelessWidget {
  const CreateAccountView({super.key});

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
                  "Create Account",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),

              SizedBox(height: 50),
              AppInput(label: "Your Name"),

              AppInput(label: "Phone Number", withCountryCode: true),
              AppInput(
                label: 'Create your password',
                isPassword: true,
                bottomSpace: 0,
              ),

              SizedBox(height: 16),

              AppInput(
                label: 'Confirm password',
                isPassword: true,
                bottomSpace: 0,
              ),

              SizedBox(height: 44),

              AppButton(text: 'Next'),
            ],
          ),
        ),
      ),
      bottomNavigationBar: AppLoginOrRegister(isLogin: false),
    );
  }
}
