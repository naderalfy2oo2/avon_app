import 'package:avon_app/core/components/app_button.dart';
import 'package:avon_app/core/components/app_image.dart';
import 'package:avon_app/core/components/app_input.dart';
import 'package:avon_app/core/components/app_login_or_register.dart';
import 'package:avon_app/core/components/helper_methods.dart';
import 'package:avon_app/views/auth/forget_password.dart';
import 'package:avon_app/views/view.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(14).copyWith(top: 48),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AppImage(image: 'login.png', height: 227, width: 284),

              SizedBox(height: 24),
              Center(
                child: Text(
                  "Login Now",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),

              SizedBox(height: 14),

              Center(
                child: Text(
                  "Please enter the details below to continue",
                  style: TextStyle(fontSize: 14, color: Color(0xff8E8EA9)),
                ),
              ),

              SizedBox(height: 24),

              AppInput(label: "Phone Number", withCountryCode: true),
              AppInput(
                label: 'Your Password',
                isPassword: true,
                bottomSpace: 0,
              ),

              Align(
                alignment: AlignmentDirectional.centerEnd,
                child: TextButton(
                  onPressed: () {
                    goTo(page: ForgetPasswordView());
                  },
                  child: Text('Forget Password?'),
                ),
              ),

              SizedBox(height: 44),

              AppButton(
                text: 'Login',
                onPressed: () {
                  goTo(page: HomeView());
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: AppLoginOrRegister(),
    );
  }
}
