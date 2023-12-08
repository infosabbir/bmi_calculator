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
            },
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
