import 'package:avon_app/core/components/helper_methods.dart';
import 'package:avon_app/views/auth/otp.dart';
import 'package:flutter/material.dart';

import '../../core/components/app_button.dart';
import '../../core/components/app_image.dart';
import '../../core/components/app_input.dart';
import '../../core/components/app_login_or_register.dart';
import '../../core/components/logic/dio_helper.dart';

class CreateAccountView extends StatefulWidget {
  const CreateAccountView({super.key});

  @override
  State<CreateAccountView> createState() => _CreateAccountViewState();
}

class _CreateAccountViewState extends State<CreateAccountView> {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final emailController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  String? selectedCountryCode;

  bool isClicked = false;



  Future<bool> SendData() async {
    final resp = await DioHelper.SendData(
      path: "api/Auth/register",
      data: {
        "username": nameController.text.trim(),
        "countryCode": selectedCountryCode,
        "phoneNumber": phoneController.text.trim(),
        "email": emailController.text.trim(),
        "password": passwordController.text.trim(),
      },
    );

    print(" ${resp.data}");
    print(" ${resp.msg}");

    if (resp.isSucess) {
      showMsg("Account created successfully");
      return true;
    } else {
      showMsg(resp.msg ?? "Register failed", isError: true);
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: formKey,
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
                AppInput(label: "Your Name", controller: nameController),

                AppInput(
                  label: "Phone Number",
                  withCountryCode: true,
                  controller: phoneController,
                  onCountryCodeChanged: (value) {
                    selectedCountryCode = value;
                  },
                ),

                AppInput(label: 'email', controller: emailController),

                AppInput(
                  label: 'Create your password',
                  isPassword: true,
                  bottomSpace: 0,
                  controller: passwordController,
                ),

                SizedBox(height: 16),

                AppInput(
                  label: 'Confirm password',
                  isPassword: true,
                  bottomSpace: 0,
                  controller: confirmPasswordController,
                ),

                SizedBox(height: 44),

                
                AppButton(
                  text: 'Next',

                  onPressed: () async {
                    print(" ${phoneController.text}");
                    print(" $selectedCountryCode");
                    isClicked = true;

                    if (!formKey.currentState!.validate()) return;

                    if (passwordController.text !=
                        confirmPasswordController.text) {
                      showMsg("Passwords inCorrect", isError: true);
                      return;
                    }

                    if (selectedCountryCode == null) {
                      showMsg("Select country code", isError: true);
                      return;
                    }

                    if (await SendData()) {
                 

                      goTo(
                        page: OtpView(
                          isFormCreateAccount: true,
                          phoneNumber: phoneController.text.trim(),
                          countryCode: selectedCountryCode,
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: AppLoginOrRegister(isLogin: false),
    );
  }
}
