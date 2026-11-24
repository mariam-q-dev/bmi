// bmi_result.dart
import 'package:bmi_app/app_colors.dart';
import 'package:flutter/material.dart';

class BmiResult extends StatelessWidget {
  const BmiResult({super.key, required this.bmi});
  final double bmi;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0A0E21),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Color(0xff0A0E21),
        title: Text(
          "Your Result:",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 36,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        margin: EdgeInsets.fromLTRB(15, 70, 16, 193),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppColors.secClr,
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Column(
            children: [
              getUserStatus(bmi),
              Text(
                bmi.toStringAsFixed(2),
                style: TextStyle(
                  color: Color(0xffFFFFFF),
                  fontSize: 80,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Text getUserStatus(double bmi) {
  switch (bmi) {
    case < 18:
      return Text(
        "UnderWeight",
        style: TextStyle(
          fontSize: 35,
          fontWeight: FontWeight.w700,
          color: Colors.red,
        ),
      );
    case >= 18 && < 25:
      return Text(
        "Normal",
        style: TextStyle(
          fontSize: 35,
          fontWeight: FontWeight.w700,
          color: Colors.green,
        ),
      );
    case >= 25 && < 30:
      return Text(
        "Over Weight",
        style: TextStyle(
          fontSize: 35,
          fontWeight: FontWeight.w700,
          color: Colors.blue,
        ),
      );
    default:
      return Text(
        "Obese",
        style: TextStyle(
          fontSize: 35,
          fontWeight: FontWeight.w700,
          color: Colors.yellow,
        ),
      );
  }
}
