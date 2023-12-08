import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class BmiHome extends StatefulWidget {
  const BmiHome({super.key});

  @override
  State<BmiHome> createState() => _BmiHomeState();
}

class _BmiHomeState extends State<BmiHome> {
  double heightValue = 1.5;
  double weightValue = 50.0;
  String status = '';
  double bmi = 0.0;
  Color color = Colors.green;

  _updateBmi() {
    bmi = weightValue / (heightValue * heightValue);
    _updateStatus();
    _updateColor();
  }

  _updateStatus() {
    status = getStatus();
  }

  _updateColor() {
    if (bmi < 16.0) {
      color = Colors.green.shade100;
    } else if (bmi >= 16.0 && bmi <= 16.9) {
      color = Colors.green.shade200;
    } else if (bmi >= 17.0 && bmi <= 18.4) {
      color = Colors.green.shade300;
    } else if (bmi >= 18.5 && bmi <= 24.9) {
      color = Colors.green;
    } else if (bmi >= 25.0 && bmi <= 29.9) {
      color = Colors.red.shade200;
    } else if (bmi >= 30.0 && bmi <= 34.9) {
      color = Colors.red.shade300;
    } else if (bmi >= 35.0 && bmi <= 39.9) {
      color = Colors.red.shade400;
    } else {
      color = Colors.red.shade600;
    }
  }

  String getStatus() {
    if (bmi < 16.0) {
      return BMI.underWeightSevere;
    }
    if (bmi >= 16.0 && bmi <= 16.9) {
      return BMI.underWeightModerate;
    }
    if (bmi >= 17.0 && bmi <= 18.4) {
      return BMI.underWeightMild;
    }
    if (bmi >= 18.5 && bmi <= 24.9) {
      return BMI.normal;
    }
    if (bmi >= 25.0 && bmi <= 29.9) {
      return BMI.overWeightPre;
    }
    if (bmi >= 30.0 && bmi <= 34.9) {
      return BMI.obese_1;
    }
    if (bmi >= 35.0 && bmi <= 39.9) {
      return BMI.obese_2;
    }
    return BMI.obese_3;
  }

  @override
  void initState() {
    _updateBmi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          BmiSlider(
            label: 'Height',
            unit: BmiUnit.m,
            sliderValue: heightValue,
            sliderDivision: 100,
            sliderMax: 2.2,
            sliderMin: 1.2,
            onChange: (newValue) {
              setState(() {
                heightValue = newValue;
              });
              _updateBmi();
            },
          ),
          BmiSlider(
            label: 'Weight',
            unit: BmiUnit.kg,
            sliderValue: weightValue,
            sliderDivision: 200,
            sliderMax: 130,
            sliderMin: 30,
            onChange: (newValue) {
              setState(() {
                weightValue = newValue;
              });
              _updateBmi();
            },
          ),
          Expanded(
            child: BmiResult(
              color: color,
              bmi: bmi,
              status: status,
            ),
          ),
        ],
      ),
    );
  }
}

class BmiSlider extends StatelessWidget {
  const BmiSlider({
    super.key,
    required this.label,
    required this.unit,
    required this.sliderValue,
    required this.sliderDivision,
    required this.sliderMax,
    required this.sliderMin,
    required this.onChange,
  });

  final String label;
  final BmiUnit unit;
  final double sliderValue;
  final int sliderDivision;
  final double sliderMax, sliderMin;
  final Function(double) onChange;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              label,
              style: txtLabelStyle,
            ),
            const SizedBox(
              width: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: RichText(
                text: TextSpan(
                  text: sliderValue.toStringAsFixed(1),
                  style: txtValueStyle,
                  children: [
                    TextSpan(
                      text: unit.name,
                      style: txtLabelStyle.copyWith(fontSize: 20),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Slider(
          activeColor: Colors.white70,
          inactiveColor: Colors.white30,
          label: sliderValue.toStringAsFixed(1),
          value: sliderValue,
          divisions: sliderDivision,
          max: sliderMax,
          min: sliderMin,
          onChanged: (value) {
            onChange(value);
          },
        ),
      ],
    );
  }
}

class BmiResult extends StatelessWidget {
  final Color color;
  final double bmi;
  final String status;

  const BmiResult({
    super.key,
    required this.color,
    required this.bmi,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedContainer(
          duration: const Duration(
            milliseconds: 500,
          ),
          alignment: Alignment.center,
          width: 160,
          height: 160,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: color,
              width: 10,
            ),
          ),
          child: Text(
            bmi.toStringAsFixed(1),
            style: txtValueStyle.copyWith(
              fontSize: 60,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            status,
            style: txtResultStyle,
          ),
        ),
      ],
    );
  }
}
