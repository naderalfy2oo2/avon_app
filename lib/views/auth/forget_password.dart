import 'package:avon_app/core/components/app_Back.dart';
import 'package:avon_app/core/components/helper_methods.dart';
import 'package:avon_app/core/components/logic/dio_helper.dart';
import 'package:avon_app/core/components/logic/input_validator.dart';
import 'package:avon_app/views/auth/otp.dart';
import 'package:flutter/material.dart';

import '../../core/components/app_button.dart';
import '../../core/components/app_image.dart';
import '../../core/components/app_input.dart';

class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({super.key});

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  final phoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  String? selectedCountryCode;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: formKey,
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
                  controller: phoneController,
                  validator: InputValidator.phoneValidator,
                  label: "Phone Number",
                  withCountryCode: true,
                  bottomSpace: 56,
                  onCountryCodeChanged: (value) {
                    selectedCountryCode = value;
                  },
                ),

                AppButton(
                  text: 'Next',
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      final resp = await DioHelper.SendData(
                        path: 'api/Auth/forgot-password',
                        data: {
                          "countryCode": selectedCountryCode,
                          "phoneNumber": phoneController.text.trim(),
                        },
                      );
                      if (resp.isSucess) {
                        goTo(
                          page: OtpView(
                            phoneNumber: phoneController.text.trim(),
                            countryCode: selectedCountryCode,
                          ),
                        );
                      } else {
                        showMsg(resp.msg!, isError: true);
                      }
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
