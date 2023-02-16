import 'package:flutter/material.dart';

import 'WelcomeScreen.dart';

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
      home: WelcomeScreen(),
    );
  }
}
