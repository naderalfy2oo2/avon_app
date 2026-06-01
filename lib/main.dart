import 'package:avon_app/views/view.dart';
import 'package:flutter/material.dart';

void main() {
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
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
          hintStyle: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: Color(0xff8E8EA9),
          ),

          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xffB383C1)),
            borderRadius: BorderRadius.circular(25),
          ),
        ),

        colorScheme: .fromSeed(seedColor: Color(0xffD75D72)),
        useMaterial3: true,
        scaffoldBackgroundColor: Color(0xffD9D9D9),
      ),
      home: HomeView(),
    );
  }
}
