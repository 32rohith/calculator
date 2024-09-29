
// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors

import 'package:calculator/components/my_layout.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:provider/provider.dart';

import '../models/digits.dart';
import '../theme/theme_provider.dart';
import 'my_area.dart';

class Display extends StatefulWidget {
  const Display({super.key});

  @override
  _DisplayState createState() => _DisplayState();
}

class _DisplayState extends State<Display> {
  var computingText = '';
  var resultsText = '';
  
  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    Color? textColor;
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: WrittableArea(
                  computingText: computingText,
                  textColor: textColor,
                  resultsText: resultsText),
            ),
          ),
          Expanded(
              flex: 2,
              child: Container(
                 decoration: BoxDecoration(
               borderRadius: BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25)),
              color: (themeProvider.isDarkMode) ? const Color.fromARGB(255, 24, 20, 20) : const Color.fromARGB(255, 243, 240, 240)
            ),
            padding: const EdgeInsets.all(12),
                child: Padding(
                    padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0),
                    child: MyLayout(
                        computeText: computeText,
                        resultsText: resultsText,
                        computingText: computingText)),
              ),
            ),
          
        ],
      ),
    );
  }

  void computeText({required int index}) {
    setState(() {
      if (buttons[index] == 'undo') {
        computingText = '';
        resultsText = '';
      } else if (buttons[index] == 'plus_minus') {
      } else if (buttons[index] == 'X' ||
          buttons[index] == '-' ||
          buttons[index] == '+') {
        if (resultsText.isNotEmpty) {
          computingText = resultsText + buttons[index];
          resultsText = '';
        } else {
          computingText += buttons[index];
        }
      } else if (buttons[index] == 'C') {
        if (computingText.isEmpty) {
        } else {
          computingText = computingText.substring(0, computingText.length - 1);
        }
      } else if (buttons[index] == '=') {
        equalPressed();
      } else if (buttons[index] == 'diviser') {
        if (resultsText.isNotEmpty) {
          computingText = '$resultsText/';
          resultsText = '';
        } else {
          computingText += '/';
        }
      } else {
        computingText += buttons[index];
      }
    });
  }

  void showErrorDialog(BuildContext context, String errorMessage) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("ERROR!"),
        content: Text(errorMessage),
        actions: <Widget>[
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
          ),
        ],
      );
    },
  );
}

  void equalPressed() {
    try {
      final finalComputing = computingText;
      var finalComputingText = finalComputing.replaceAll('X', '*');
      Parser p = Parser();
      Expression exp = p.parse(finalComputingText);
      ContextModel cm = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, cm);
      resultsText = eval.toString();
    } catch(e){
        showErrorDialog(context, e.toString());
    }
  }
}