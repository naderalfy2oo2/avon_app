import 'package:avon_app/views/auth/forget_password.dart';
import 'package:avon_app/views/auth/login.dart';
import 'package:avon_app/views/auth/new_password.dart';
import 'package:avon_app/views/auth/otp.dart';
import 'package:avon_app/views/check_out.dart';
import 'package:avon_app/views/home/pages/profile/view.dart';
import 'package:avon_app/views/on_boarding.dart';
import 'package:avon_app/views/splash.dart';
import 'package:avon_app/views/view.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/components/helper_methods.dart';
import 'views/auth/create_account.dart';

late SharedPreferences prefs;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        cardColor: Color(0xffD9D9D9),
        fontFamily: 'Montserrat',

        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            fixedSize: Size.fromHeight(65),
            backgroundColor: Color(0xff434C6D),
          ),
        ),

        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(foregroundColor: Color(0xff434C6D)),
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Color(0xff434C6D),
        ),

        appBarTheme: AppBarTheme(
          color: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          elevation: 0,
          titleTextStyle: TextStyle(
            color: Color(0xff434C6D),
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          hintStyle: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: Color(0xff8E8EA9),
          ),
          labelStyle: TextStyle(fontSize: 12, color: Color(0xff8E8EA9)),
          floatingLabelStyle: TextStyle(fontSize: 14, color: Color(0xff8E8EA9)),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: Color(0xff5A669066).withValues(alpha: .40),
            ),
          ),

          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xffB383C1)),
            borderRadius: BorderRadius.circular(8),
          ),
        ),

        textTheme: TextTheme(
          bodyMedium: TextStyle(color: Color(0xff434C6D), fontSize: 16),
        ),

        colorScheme: .fromSeed(seedColor: Color(0xffD75D72)),

        scaffoldBackgroundColor: Color(0xffD9D9D9),
      ),
      navigatorKey: navKey,
      home: SplashView(),
    );
  }
}
