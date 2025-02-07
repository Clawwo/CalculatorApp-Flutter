import 'package:calculator/config/themes.dart';
import 'package:calculator/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'CalculatorApp',
      theme: lightTheme,
      home: HomePage(),
    );
  }
}
