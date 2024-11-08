import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final Widget child;
  final void Function()? onPressed;
  final Color? color;

  const PrimaryButton(
      {super.key,
      required this.child,
      required this.onPressed,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 60.0,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(13.7)),
        child: Center(child: child),
      ),
    );
  }
}
