import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({super.key, required this.btnText, this.onPressed});

  final String btnText;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: .symmetric(vertical: 15.0),
        width: .infinity,
        height: 80.0,
        color: colorScheme.primary,
        child: Text(
          btnText,
          textAlign: TextAlign.center,
          style: textTheme.headlineMedium!.copyWith(
            color: colorScheme.onPrimary,
          ),
        ),
      ),
    );
  }
}
