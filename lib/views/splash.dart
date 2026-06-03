import 'package:animate_do/animate_do.dart';
import 'package:avon_app/core/components/app_image.dart';
import 'package:avon_app/core/components/helper_methods.dart';
import 'package:avon_app/views/on_boarding.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        goTo(page: const OnBoardingView());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Wobble(
          duration: Duration(seconds: 2),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppImage(
                image: 'splash.png',
                height: 200,
                width: 200,
                bottomSpace: 16,
              ),
              AppImage(image: 'splash2.png', width: 120, height: 46),
            ],
          ),
        ),
      ),
    );
  }
}
