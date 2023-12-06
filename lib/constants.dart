import 'package:flutter/material.dart';

const backgroundColor = Colors.lightBlue;
const txtLabelStyle = TextStyle(
  color: Colors.white70,
  fontSize: 22,
);
const txtValueStyle = TextStyle(
  color: Colors.white,
  fontSize: 40,
);

abstract final class BMI {
  static const String underWeightSevere = 'Underweight (Severe thinnes)';
  static const String underWeightModerate = 'Underweight (Moderate thinnes)';
  static const String underWeightMild = 'Underweight (Mild thinnes)';
  static const String normal = 'Normal';
  static const String overWeightPre = 'OverWeight (Pre-obese)';
  static const String obese_1 = 'Obese (Class I)';
  static const String obese_2 = 'Obese (Class II)';
  static const String obese_3 = 'Obese (Class III)';


}

enum BmiUnit {
  m, ft, kg, lb,
}
