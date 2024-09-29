// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;

  bool get isDarkMode => ThemeMode.dark == themeMode;

  void toogleTheme({required bool brightMode}) {
    themeMode = brightMode ? ThemeMode.light : ThemeMode.dark;
    notifyListeners();
  }
}

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: const Color(0xFFFFFFFF),
    primaryColor: const Color(0xFFbdbec0),
    textTheme: const TextTheme(
      displayMedium: TextStyle(
        color: Color(0xFF060709),
        fontSize: 24,
        fontWeight: FontWeight.w700,
      ),
      bodyLarge: TextStyle(
        color: Color(0xFF060709),
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
      bodyMedium: TextStyle(
        color: Color(0xFF5d5f63),
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      labelLarge: TextStyle(
        fontSize: 25,
      ),
    ), colorScheme: const ColorScheme.dark().copyWith(
      secondary: const Color(0xFFbdbec0),
    ).copyWith(background: const Color(0xFFFFFFFF)),
  );

  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: const Color(0xFF22252d),
    primaryColor: const Color(0xFFbdbec0),
    fontFamily: 'Mulish',
    textTheme: const TextTheme(
      displayMedium: TextStyle(
        color: Color(0xFFF7F7FC),
        fontSize: 24,
        fontWeight: FontWeight.w700,
      ),
      bodyLarge: TextStyle(
        color: Color(0xFFF7F7FC),
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
      bodyMedium: TextStyle(
        color: Color(0xFFbdbec0),
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      labelLarge: TextStyle(
        fontSize: 25,
      ),
    ), colorScheme: const ColorScheme.dark().copyWith(
      secondary: const Color(0xFFbdbec0),
    ).copyWith(background: const Color(0xFFFFFFFF)),
  );
}