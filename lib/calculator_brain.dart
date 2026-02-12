import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({
    required this.selectFeet,
    required this.selectInch,

    required this.weight,
  });

  final double selectFeet;
  final double selectInch;

  final double weight;

  double _bmi = 0.0;

  String get calculateBMI {
    double totalInch = (selectFeet * 12) + selectInch;
    double heightInMeters = totalInch * 0.0254;

    _bmi = weight / pow(heightInMeters, 2);
    return _bmi.toStringAsFixed(1);
  }

  String get resultText {
    if (_bmi < 18.5) {
      return 'UnderWeight';
    } else if (_bmi >= 18.5 && _bmi <= 24.9) {
      return 'Normal';
    } else if (_bmi >= 25.0 && _bmi <= 29.9) {
      return 'OverWeight';
    } else if (_bmi >= 30.0) {
      return 'Obese';
    } else {
      return 'Unknown Result';
    }
  }

  String get interpretationText {
    if (_bmi < 18.5) {
      return 'Your BMI is low compared to the recommended range. You may benefit from eating more nutrient-rich foods and maintaining a regular meal routine.';
    } else if (_bmi >= 18.5 && _bmi <= 24.9) {
      return 'Your BMI falls within the recommended healthy range. Keep up your balanced diet and active lifestyle.';
    } else if (_bmi >= 25.0 && _bmi <= 29.9) {
      return 'Your BMI is above the recommended range. Adding more physical activity and mindful eating habits may help improve overall health.';
    } else if (_bmi >= 30.0) {
      return 'Your BMI is significantly above the recommended range. Healthy lifestyle changes could be helpful, and speaking with a health professional may provide personalized advice.';
    } else {
      return 'Unknown Interpretation Result!';
    }
  }
}
