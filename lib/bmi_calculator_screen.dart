// bmi_calculator_screen.dart
import 'dart:developer';

import 'package:bmi_app/app_colors.dart';
import 'package:bmi_app/bmi_result.dart';
import 'package:bmi_app/gender_container_widget.dart';
import 'package:flutter/material.dart';

class BmiCalculatorScreen extends StatefulWidget {
  const BmiCalculatorScreen({super.key});

  @override
  State<BmiCalculatorScreen> createState() => _BmiCalculatorScreenState();
}

class _BmiCalculatorScreenState extends State<BmiCalculatorScreen> {
  double height = 180;
  int weight = 60;
  int age = 26;
  String gender = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0A0E21),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.secClr,
        title: Text(
          "BMI calculator",
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(41, 31, 45, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //* Gender Section
                    Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            borderRadius: BorderRadius.circular(15),
                            splashColor: AppColors.secClr,
                            onTap: () {
                              gender = 'Female';
                              setState(() {});
                            },
                            child: GenderContainerWidget(
                              title: "Female",
                              icon: Icons.female,
                              backgroundColor: gender == 'Female'
                                  ? Colors.pink
                                  : AppColors.secClr,
                            ),
                          ),
                        ),
                        SizedBox(width: 40),
                        Expanded(
                          child: InkWell(
                            borderRadius: BorderRadius.circular(15),
                            splashColor: AppColors.secClr,
                            onTap: () {
                              gender = 'Male';
                              setState(() {});
                            },
                            child: GenderContainerWidget(
                              title: "Male",
                              icon: Icons.male,
                              backgroundColor: gender == 'Male'
                                  ? Colors.blue
                                  : AppColors.secClr,
                            ),
                          ),
                        ),
                      ],
                    ),
                    //* Height Section
                    Container(
                      padding: EdgeInsets.fromLTRB(39, 38, 26, 52),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: AppColors.secClr,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "HIEGHT",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              height: 2,
                              letterSpacing: .25,
                            ),
                          ),
                          Text(
                            "${height.toStringAsFixed(0)} cm",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              height: 2,
                              letterSpacing: .25,
                            ),
                          ),
                          Slider(
                            min: 120,
                            max: 210,
                            value: height,
                            onChanged: (newVal) {
                              height = newVal;
                              setState(() {});
                            },
                          ),
                        ],
                      ),
                    ),
                    //* User Info Section
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: AppColors.secClr,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              spacing: 10,
                              children: [
                                Text(
                                  "Weight",
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  weight.toString(),
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  ),
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        if (weight == 0) return;
                                        weight--;

                                        setState(() {});
                                      },
                                      icon: Icon(Icons.remove),
                                      style: IconButton.styleFrom(
                                        backgroundColor: Colors.white,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        weight++;
                                        setState(() {});
                                      },
                                      icon: Icon(Icons.add),
                                      style: IconButton.styleFrom(
                                        backgroundColor: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 40),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: AppColors.secClr,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              spacing: 10,
                              children: [
                                Text(
                                  "Age",
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  age.toString(),
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  ),
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        if (age == 0) return;
                                        age--;
                                        setState(() {});
                                      },
                                      icon: Icon(Icons.remove),
                                      style: IconButton.styleFrom(
                                        backgroundColor: Colors.white,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        age++;
                                        setState(() {});
                                      },
                                      icon: Icon(Icons.add),
                                      style: IconButton.styleFrom(
                                        backgroundColor: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 40), //* Button
            ElevatedButton(
              onPressed: () {
                double bmiCal = weight / (height * height / 10000);
                log(
                  "Height: ${height.toStringAsFixed(2)}, Weight: $weight, BMI: $bmiCal",
                );
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return BmiResult(bmi: bmiCal);
                    },
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                minimumSize: Size(double.infinity, 50),
              ),
              child: Text(
                "CALCULATE",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
