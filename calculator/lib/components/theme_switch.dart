// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../theme/theme_provider.dart';

class ThemeSwitch extends StatefulWidget {
  const ThemeSwitch({super.key});

  @override
  _ThemeSwitchState createState() => _ThemeSwitchState();
}

class _ThemeSwitchState extends State<ThemeSwitch> {
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    bool isSelected = themeProvider.isDarkMode;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.25,
          height: MediaQuery.of(context).size.height * 0.07,
          decoration: BoxDecoration(
              color: (themeProvider.isDarkMode)
                  ? const Color(0xFF2a2d37)
                  : const Color(0xFFf9f9f9),
              borderRadius: const BorderRadius.all(Radius.circular(25))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  themeProvider.toogleTheme(brightMode: true);
                },
                child: SizedBox(
                  height: 30,
                  child: Image.asset(
                    'assets/bright.png',
                    color: isSelected ? Colors.grey : const Color(0xFF0F1828),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  themeProvider.toogleTheme(brightMode: false);
                },
                child: SizedBox(
                  height: 25,
                  child: Image.asset(
                    'assets/sleep-mode.png',
                    color: isSelected ? Colors.white : Colors.grey,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}