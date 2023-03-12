import 'package:flutter/material.dart';

final darkTheme = ThemeData(
  // useMaterial3: true,
  // colorScheme: ColorScheme(
  //   brightness: Brightness.dark,
  //   primary: Colors.red,
  //   onPrimary: Colors.white,
  //   secondary: Colors.green,
  //   onSecondary: Colors.white,
  //   primaryContainer: Colors.pink,
  //   error: Colors.black,
  //   onError: Colors.white,
  //   background: Colors.blue,
  //   onBackground: Colors.white,
  //   surface: Colors.pink,
  //   onSurface: Colors.white,
  // ),
  //primarySwatch: Colors.grey,
  // primaryColor: Colors.black,
  // primaryColorBrightness: Brightness.dark,
  // primaryColorLight: Colors.black,
  // primaryColorDark: Colors.black,
  // canvasColor: Colors.black,
  // brightness: Brightness.dark,
  // backgroundColor: const Color(0xFF212121),
  // accentColor: Colors.white,
  // accentIconTheme: IconThemeData(color: Colors.black),
  // dividerColor: Colors.black12,
  // appBarTheme: AppBarTheme(brightness: Brightness.dark)
);

final lightTheme = ThemeData(
  //primarySwatch: Colors.grey,
  primaryColor: Colors.white,
  brightness: Brightness.light,
  backgroundColor: const Color(0xFFFFF8F8),
  accentColor: Colors.black,
  accentIconTheme: IconThemeData(color: Colors.white),
  dividerColor: Colors.white,
    appBarTheme: AppBarTheme(brightness: Brightness.light,
    backgroundColor: Color(0xFFFFF8F8)
    )

);


class ThemeNotifier with ChangeNotifier {
  ThemeData _themeData;

  ThemeNotifier(this._themeData);

  getTheme() => _themeData;

  setTheme(ThemeData themeData) async {
    _themeData = themeData;
    notifyListeners();
  }
}