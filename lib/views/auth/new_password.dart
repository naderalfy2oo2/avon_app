import 'package:avon_app/views/auth/sucess_dialog.dart';
import 'package:flutter/material.dart';

import '../../core/components/app_button.dart';
import '../../core/components/app_image.dart';
import '../../core/components/app_input.dart';
import '../../core/components/helper_methods.dart';
import '../../core/components/logic/dio_helper.dart';

class NewPasswordView extends StatefulWidget {
  final String? phoneNumber;
  final String? countryCode;
  const NewPasswordView({super.key, this.phoneNumber, this.countryCode});

  @override
  State<NewPasswordView> createState() => _NewPasswordViewState();
}

class _NewPasswordViewState extends State<NewPasswordView> {
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  bool isLoginClicked = false;

  Future<bool> sendData() async {
    final resp = await DioHelper.SendData(
      path: "api/Auth/reset-password",
      data: {
        "countryCode": widget.countryCode,
        "phoneNumber": widget.phoneNumber,
        "newPassword": newPasswordController.text.trim(),
        "confirmPassword": confirmPasswordController.text.trim(),
      },
    );

    if (resp.isSucess) {
      showMsg("Password Change Successfully");
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
                AppInput(
                  label: 'New password',
                  isPassword: true,
                  bottomSpace: 0,
                  controller: newPasswordController,
                ),

                SizedBox(height: 16),

                AppInput(
                  label: 'Confirm password',
                  isPassword: true,
                  bottomSpace: 70,
                  controller: confirmPasswordController,
                ),

                AppButton(
                  text: 'Confirm',
                  onPressed: () async {
                    if (await sendData()) {
                      showDialog(
                        context: context,
                        builder: (context) => SucessDialogView(),
                      );
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
