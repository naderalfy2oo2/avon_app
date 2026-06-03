import 'package:avon_app/core/components/app_Back.dart';
import 'package:avon_app/core/components/helper_methods.dart';
import 'package:avon_app/views/auth/otp.dart';
import 'package:flutter/material.dart';

import '../../core/components/app_button.dart';
import '../../core/components/app_image.dart';
import '../../core/components/app_input.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AppBack(),

              SizedBox(height: 48),

              AppImage(image: 'splash.png', height: 64, width: 64),

              SizedBox(height: 24),
              Center(
                child: Text(
                  "Forget Password",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),

              SizedBox(height: 40),

              Center(
                child: Text(
                  "Please enter your phone number below to recovery your password.",
                  style: TextStyle(fontSize: 14, color: Color(0xff8E8EA9)),
                  textAlign: TextAlign.center,
                ),
              ),

              SizedBox(height: 24),

              AppInput(
                label: "Phone Number",
                withCountryCode: true,
                bottomSpace: 56,
              ),

              AppButton(
                text: 'Next',
                onPressed: () {
                  goTo(page: OtpView());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
