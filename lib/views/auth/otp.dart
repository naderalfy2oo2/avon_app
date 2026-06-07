import 'package:avon_app/core/components/app_resent_otp.dart';
import 'package:avon_app/core/components/app_verifyCode.dart';
import 'package:avon_app/core/components/helper_methods.dart';
import 'package:avon_app/views/auth/new_password.dart';
import 'package:flutter/material.dart';

import '../../core/components/app_back.dart';
import '../../core/components/app_button.dart';
import '../../core/components/app_image.dart';
import '../../core/components/logic/dio_helper.dart';
import 'sucess_dialog.dart';

class OtpView extends StatefulWidget {
  final bool isFormCreateAccount;
  final String? phoneNumber;
  final String? countryCode;
  const OtpView({
    super.key,
    this.isFormCreateAccount = false,
    this.phoneNumber,
    this.countryCode,
  });

  @override
  State<OtpView> createState() => _OtpViewState();
}

class _OtpViewState extends State<OtpView> {
  final otpController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  Future<bool> sendData() async {
    if (widget.countryCode == null || widget.phoneNumber == null) {
      showMsg("Missing data otp", isError: true);
      return false;
    }

    final resp = await DioHelper.SendData(
      path: "api/Auth/verify-otp",
      data: {
        "countryCode": widget.countryCode,
        "phoneNumber": widget.phoneNumber,
        "otpCode": otpController.text.trim(),
      },
    );

    print({
      "countryCode": widget.countryCode,
      "phoneNumber": widget.phoneNumber,
      "otpCode": otpController.text.trim(),
    });

    if (resp.isSucess) {
      showMsg("OTP Verified");
      return true;
    } else {
      showMsg(resp.msg ?? "Failed", isError: true);
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
                    "Verify Code",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),

                SizedBox(height: 40),

                Center(
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'We just sent a 4-digit verification code to ',
                          style: TextStyle(height: 2.4),
                        ),

                        WidgetSpan(
                          alignment: PlaceholderAlignment.middle,

                          child: Text(
                            '+20 1022658997\t',
                            textDirection: TextDirection.ltr,

                            style: TextStyle(
                              color: Color(0xff434C6D),
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),

                        TextSpan(
                          text:
                              '. Enter the code in the box below to continue.',
                        ),
                      ],
                    ),

                    style: TextStyle(fontSize: 14, color: Color(0xff8E8EA9)),
                    textAlign: TextAlign.center,
                  ),
                ),

                SizedBox(height: 40),

                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Edit the number'),
                  ),
                ),
                SizedBox(height: 20),

                AppVerifycode(
                  onCompleted: (value) {
                    otpController.text = value;
                  },
                ),
                SizedBox(height: 43),
                AppResentOtp(),
                SizedBox(height: 113),

                AppButton(
                  text: 'Done',

<<<<<<< HEAD
=======
               
>>>>>>> 511b064174d2158fd08de8574c1d9e02956bf5ce
                  onPressed: () async {
                    if (await sendData()) {
                      if (widget.isFormCreateAccount) {
                        showDialog(
                          context: context,
                          builder: (context) => SucessDialogView(
                            isFormCreateAccount: widget.isFormCreateAccount,
                          ),
                        );
                      } else {
                        goTo(
                          page: NewPasswordView(
                            phoneNumber: widget.phoneNumber,
                            countryCode: widget.countryCode,
                          ),
                        );
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
