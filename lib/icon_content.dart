import 'package:flutter/material.dart';

class IconContent extends StatelessWidget {
  const IconContent({super.key, required this.icon, required this.iconText});

  final IconData icon;
  final String iconText;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Column(
      mainAxisAlignment: .spaceEvenly,
      children: [
        Icon(icon, size: 100, color: colorScheme.onPrimaryContainer),
        Text(
          iconText,
          style: textTheme.headlineSmall!.copyWith(
            color: colorScheme.onPrimaryContainer,
            fontWeight: .bold,
          ),
        ),
      ],
    );
  }
}
