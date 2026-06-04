import 'package:avon_app/core/components/app_button.dart';
import 'package:avon_app/core/components/app_image.dart';
import 'package:avon_app/core/components/helper_methods.dart';
import 'package:avon_app/main.dart';
import 'package:avon_app/views/auth/login.dart';
import 'package:flutter/material.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final list = [
    _Model(
      image: 'on_boarding1.png',
      title: 'WELCOME!',
      description:
          'Makeup has the power to transform your mood and empowers you to be a more confident person.',
    ),
    _Model(
      image: 'on_boarding2.png',
      title: 'SEARCH & PICK',
      description:
          'We have dedicated set of products and routines hand picked for every skin type.',
    ),
    _Model(
      image: 'onboarding3.png',
      title: 'PUCH NOTIFICATIONS ',
      description: 'Allow notifications for new makeup & cosmetics offers.',
    ),
  ];

  int currentIndex = 0;

  void goToLogin() {
    prefs.setBool('isFirstTime', false);
    goTo(page: LoginView());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (currentIndex != list.length - 1)
                Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: TextButton(onPressed: goToLogin, child: Text('Skip')),
                ),

              SizedBox(height: 48),

              AppImage(
                image: list[currentIndex].image,
                height: 259.6,
                width: 238.68,
              ),
              SizedBox(height: 28),

              Text(
                list[currentIndex].title,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),

              Text(
                list[currentIndex].description,
                textAlign: TextAlign.center,

                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 30),

              currentIndex == list.length - 1
                  ? AppButton(text: 'let’s start!', onPressed: goToLogin)
                  : Center(
                      child: FloatingActionButton(
                        onPressed: () {
                          currentIndex++;
                          setState(() {});
                        },
                        child: AppImage(image: 'arrow1.svg'),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Model {
  final String image, title, description;

  _Model({required this.image, required this.title, required this.description});
}
