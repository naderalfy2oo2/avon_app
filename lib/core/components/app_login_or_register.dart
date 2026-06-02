import 'package:avon_app/views/auth/create_account.dart';
import 'package:flutter/material.dart';

import 'helper_methods.dart';

class AppLoginOrRegister extends StatelessWidget {
  final bool isLogin;
  const AppLoginOrRegister({super.key, this.isLogin = true});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: isLogin ? 'Don’t have an account?' : "Have an account?",
            ),

            WidgetSpan(
              alignment: PlaceholderAlignment.middle,
              child: TextButton(
                style: TextButton.styleFrom(
                  visualDensity: VisualDensity.compact,
                  padding: EdgeInsets.symmetric(horizontal: 2),
                ),
                onPressed: () {
                  if (isLogin) {
                    goTo(page: CreateAccountView());
                  } else {
                    Navigator.pop(context);
                  }
                },
                child: Text(isLogin ? 'Register' : 'Login'),
              ),
            ),
          ],
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
