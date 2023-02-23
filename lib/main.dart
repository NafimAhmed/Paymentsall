import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:payments_all_app/WelcomeScreen.dart';
import 'package:payments_all_app/utils/app_layout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Payments All',
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
        duration: 3000,
        splash: Scaffold(
          body: Container(
            width: AppLayout.getScreenWidth(),
            height: AppLayout.getScreenHeight(),
            child: Image.asset('assets/images/splash.png',height: 250,width: 300,),
          ),
        ),
        nextScreen: WelcomeScreen(),
        splashTransition: SplashTransition.fadeTransition,
        splashIconSize: double.maxFinite,
        backgroundColor:  Color(0xFFFFF8F8),
      )
      // WelcomeScreen(),
    );
  }
}
