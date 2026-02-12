import 'package:flutter/material.dart';

class CustomDropdown extends StatelessWidget {
  const CustomDropdown({
    super.key,
    required this.itemList,
    required this.onChanged,
    required this.unit,
    required this.selectedValue,
  });

  final List<int> itemList;
  final int selectedValue;
  final Function(dynamic value) onChanged;
  final String unit;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return DropdownButton(
      value: selectedValue,
      items: itemList
          .map(
            (e) => DropdownMenuItem(
              value: e,
              child: Text(
                '${e.toString()} $unit',
                style: textTheme.headlineMedium!.copyWith(
                  color: colorScheme.onPrimaryContainer,
                ),
              ),
            ),
          )
          .toList(),
      onChanged: onChanged,
    );
  }
}
