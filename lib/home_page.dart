import 'package:bmi_calculator/bottom_button.dart';
import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/custom_dropdown.dart';
import 'package:bmi_calculator/icon_content.dart';
import 'package:bmi_calculator/result_page.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'package:bmi_calculator/round_button.dart';
import 'package:flutter/material.dart';

enum Gender { male, female }

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Gender? selectedGender;
  double height = 180.0;
  double weight = 60.0;
  int age = 25;

  int selectFeet = 5;
  int selectInch = 6;

  List<int> feetList = [3, 4, 5, 6, 7];
  List<int> inchList = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11];

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    Color activeCardColor = colorScheme.primaryFixedDim;
    Color inactivCardColor = colorScheme.primaryContainer;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorScheme.primary,
        centerTitle: true,
        title: Text(
          'BMI CALCULATOR',
          style: textTheme.headlineMedium!.copyWith(
            fontWeight: .bold,
            color: colorScheme.onPrimary,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colour: selectedGender == Gender.male
                        ? activeCardColor
                        : inactivCardColor,
                    cardChild: IconContent(icon: Icons.male, iconText: 'MALE'),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    colour: selectedGender == Gender.female
                        ? activeCardColor
                        : inactivCardColor,
                    cardChild: IconContent(
                      icon: Icons.female,
                      iconText: 'FEMALE',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: activeCardColor,
              cardChild: Column(
                mainAxisAlignment: .spaceEvenly,
                children: [
                  Text(
                    'HEIGHT',
                    style: textTheme.headlineMedium!.copyWith(
                      fontWeight: .bold,
                      color: colorScheme.onPrimaryContainer
                    ),
                  ),
                  Row(
                    mainAxisAlignment: .spaceEvenly,
                    children: [
                      CustomDropdown(
                        itemList: feetList,
                        onChanged: (value) {
                          setState(() {
                            selectFeet = value;
                          });
                        },
                        unit: 'Ft',
                        selectedValue: selectFeet,
                      ),
                      
                      CustomDropdown(
                        itemList: inchList,
                        onChanged: (value) {
                          setState(() {
                            selectInch = value;
                          });
                        },
                        unit: 'Inch',
                        selectedValue: selectInch,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: activeCardColor,
                    cardChild: Column(
                      mainAxisAlignment: .spaceEvenly,
                      children: [
                        Text(
                          'WEIGHT',
                          style: textTheme.headlineSmall!.copyWith(
                            fontWeight: .bold,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: .center,
                          crossAxisAlignment: .baseline,
                          textBaseline: .alphabetic,
                          children: [
                            Text(
                              weight.toStringAsFixed(0),
                              style: textTheme.displayLarge,
                            ),
                            Text('KG', style: textTheme.labelLarge),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: .center,
                          children: [
                            RoundButton(
                              btnColor: colorScheme.primary,
                              icon: Icons.remove,
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(width: 16.0),
                            RoundButton(
                              btnColor: colorScheme.primary,
                              icon: Icons.add,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: activeCardColor,
                    cardChild: Column(
                      mainAxisAlignment: .spaceEvenly,
                      children: [
                        Text(
                          'AGE',
                          style: textTheme.headlineSmall!.copyWith(
                            fontWeight: .bold,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: .center,
                          crossAxisAlignment: .baseline,
                          textBaseline: .alphabetic,
                          children: [
                            Text(age.toString(), style: textTheme.displayLarge),
                            Text('Years', style: textTheme.labelLarge),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: .center,
                          children: [
                            RoundButton(
                              btnColor: colorScheme.primary,
                              icon: Icons.remove,
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(width: 16.0),
                            RoundButton(
                              btnColor: colorScheme.primary,
                              icon: Icons.add,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            btnText: 'CALCULATE',
            onPressed: () {
              CalculatorBrain calc = CalculatorBrain(
                selectFeet: selectFeet.toDouble(),
                selectInch: selectInch.toDouble(),
                weight: weight,
              );

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    bmiResult: calc.calculateBMI,
                    resultText: calc.resultText,
                    interpretationText: calc.interpretationText,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
