import 'package:flutter/material.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int weight = 20;
  int height = 120;
  
  @override
  Widget build(BuildContext context) {
    final colour = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: colour.surface,
      appBar: AppBar(
        backgroundColor: colour.surfaceContainer,
        centerTitle: true,
        title: Text(
          'BMI CALCULATOR',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(colour: colour.surfaceContainerLow),
                ),
                Expanded(
                  child: ReusableCard(colour: colour.surfaceContainerLow),
                ),
              ],
            ),
          ),
          Expanded(child: ReusableCard(colour: colour.surfaceContainerLow)),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(colour: colour.surfaceContainerLow),
                ),
                Expanded(
                  child: ReusableCard(colour: colour.surfaceContainerLow),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 12),
            color: colour.primary,
            width: double.infinity,
            height: 80,
            child: Text(
              'CALCULATE',
              style: textTheme.displaySmall!.copyWith(
                color: colour.onPrimary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ReusableCard extends StatelessWidget {
  const ReusableCard({super.key, required this.colour});

  final Color colour;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12.0),

      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}
