import 'package:flutter/material.dart';

class SecondaryButton extends StatelessWidget {
  final Widget child;
  final void Function()? onPressed;
  final Color? color;
  final double? width;

  const SecondaryButton(
      {super.key,
      required this.child,
      required this.onPressed,
      required this.color,
      this.width});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(10)),
        child: child,
      ),
    );
  }
}
