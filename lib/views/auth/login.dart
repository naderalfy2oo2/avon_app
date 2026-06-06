import 'package:avon_app/core/components/app_button.dart';
import 'package:avon_app/core/components/app_image.dart';
import 'package:avon_app/core/components/app_input.dart';
import 'package:avon_app/core/components/app_login_or_register.dart';
import 'package:avon_app/core/components/helper_methods.dart';
import 'package:avon_app/core/components/logic/dio_helper.dart';
import 'package:avon_app/views/auth/forget_password.dart';
import 'package:avon_app/views/view.dart';

import 'package:flutter/material.dart';

import '../../core/components/logic/input_validator.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  String? selectedCountryCode;
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isLoginClicked = false;

  Future<bool> SendData() async {
    final phone = phoneController.text.trim();
    final password = passwordController.text.trim();

    print(phone);
    print(password);
    print(selectedCountryCode);

    final resp = await DioHelper.SendData(
      path: "api/Auth/login",
      data: {
        "countryCode": selectedCountryCode,
        "phoneNumber": phone,
        "password": password,
      },
    );

    if (resp.isSucess) {
      print(resp.data);

      DioHelper.token = resp.data!["token"];

      print("TOKEN = ${DioHelper.token}");

      showMsg('Login Success');
      return true;
    } else {
      showMsg(resp.msg ?? "", isError: true);
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: formKey,
          onChanged: () {
            if (isLoginClicked) {
              formKey.currentState!.validate();
            }
          },

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

                AppInput(
                  validator: InputValidator.phoneValidator,
                  label: "Phone Number",

                  withCountryCode: true,
                  controller: phoneController,
                  onCountryCodeChanged: (value) {
                    selectedCountryCode = value.toString();
                  },
                ),
                AppInput(
                  validator: InputValidator.passwordValidator,

                  label: 'Your Password',
                  controller: passwordController,
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
                  isLoading: false,
                  text: 'Login',
                  onPressed: () async {
                    isLoginClicked = true;
                    if (!formKey.currentState!.validate()) return;
                    if (await SendData()) {
                      goTo(page: HomeView());
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: AppLoginOrRegister(),
    );
  }
}
