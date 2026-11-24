// main.dart
import 'package:bmi_app/bmi_calculator_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(BMIApp());
}

class BMIApp extends StatefulWidget {
  const BMIApp({super.key});

  @override
  State<BMIApp> createState() => _BMIAppState();
}

class _BMIAppState extends State<BMIApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BmiCalculatorScreen(),
    );
  }
}
