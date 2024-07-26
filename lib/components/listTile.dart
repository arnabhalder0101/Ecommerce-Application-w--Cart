import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ListTiles extends StatelessWidget {
  void Function()? onTap;
  Widget leading;
  Text title;
  ListTiles(
      {super.key,
      required this.title,
      required this.leading,
      required this.onTap});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: ListTile(
        leading: leading,
        title: title,
        onTap: onTap,
      ),
    );
  }
}
