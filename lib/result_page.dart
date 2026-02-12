import 'package:bmi_calculator/bottom_button.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({
    super.key,
    required this.bmiResult,
    required this.resultText,
    required this.interpretationText,
  });

  final String bmiResult;
  final String resultText;
  final String interpretationText;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 120,
        backgroundColor: colorScheme.primary,
        iconTheme: IconThemeData(color: colorScheme.onPrimary),
        centerTitle: true,
        title: Text(
          'YOUR BMI RESULT',
          style: textTheme.headlineMedium!.copyWith(
            color: colorScheme.onPrimary,
            fontWeight: .bold,
          ),
        ),
      ),
      body: Container(
        margin: .all(15.0),
        decoration: BoxDecoration(
          color: colorScheme.primaryContainer,
          borderRadius: BorderRadius.only(
            // topLeft: Radius.circular(30.0),
            // topRight: Radius.circular(30.0),
            bottomLeft: Radius.circular(30.0),
            bottomRight: Radius.circular(30.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: .spaceEvenly,
            children: [
              Text(
                resultText,
                style: textTheme.headlineMedium!.copyWith(
                  color: colorScheme.onPrimaryContainer,
                  fontWeight: .bold,
                ),
              ),
              Text(
                bmiResult,
                textAlign: TextAlign.center,
                style: textTheme.displayLarge!.copyWith(
                  color: colorScheme.onPrimaryContainer,
                ),
              ),
              Text(
                interpretationText,
                textAlign: TextAlign.center,
                style: textTheme.bodyLarge!.copyWith(
                  color: colorScheme.onPrimaryContainer,
                ),
              ),
              BottomButton(
                btnText: 'RE-CALCULATE',
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
