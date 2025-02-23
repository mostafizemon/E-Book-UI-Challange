import 'package:flutter/material.dart';
import 'package:ui_challange/app/app_theme_data.dart';
import 'package:ui_challange/common/screens/main_bottom_nav_screen.dart';
import 'package:ui_challange/screens/book_details_screen/book_details_screen.dart';
import 'package:ui_challange/screens/splash_screen/splash_screen.dart';

class Erabook extends StatelessWidget {
  const Erabook({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppThemeData.lightThemeData,
      darkTheme: AppThemeData.darkThemeData,
      home: MainBottomNavScreen(),
    );
  }
}
