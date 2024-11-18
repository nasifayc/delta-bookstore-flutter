import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final Widget child;
  final void Function()? onPressed;
  final Color? color;
  final double? width;

  const PrimaryButton(
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
        height: 55.0,
        width: width ?? MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(10)),
        child: Center(child: child),
      ),
    );
  }
}
