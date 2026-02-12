import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  const RoundButton({super.key, this.icon, this.onPressed, this.btnColor});

  final IconData? icon;
  final Function()? onPressed;
  final Color? btnColor;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: BoxConstraints.tightFor(width: 46, height: 46),
      shape: CircleBorder(),
      fillColor: btnColor,
      onPressed: onPressed,
      child: Icon(icon, color: Colors.white),
    );
  }
}