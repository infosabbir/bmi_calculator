import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  const ReusableCard({
    super.key,
    required this.colour,
    this.cardChild,
    this.onTap,
  });

  final Color colour;
  final Widget? cardChild;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: .all(15.0),
        width: .infinity,
        decoration: BoxDecoration(color: colour, borderRadius: .circular(10.0)),
        child: cardChild,
      ),
    );
  }
}
