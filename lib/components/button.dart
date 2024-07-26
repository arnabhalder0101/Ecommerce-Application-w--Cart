import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  Color color;
  final Widget child;
  final void Function()? onTap;
  MyButton(
      {super.key,
      required this.child,
      required this.color,
      required this.onTap});
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.all(20),
      onPressed: onTap,
      child: child,
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}
