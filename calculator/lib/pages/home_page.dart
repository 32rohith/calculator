import 'package:calculator/components/display.dart';
import 'package:calculator/components/theme_switch.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: SizedBox(
            height: MediaQuery.sizeOf(context).height,
            width: MediaQuery.sizeOf(context).width,
            child: const Column(
              children: [
                ThemeSwitch(),
                Display(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}