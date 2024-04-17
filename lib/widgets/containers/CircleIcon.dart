import 'package:enfluwence/utills/consts/colors.dart';
import 'package:enfluwence/utills/consts/icons.dart';
import 'package:flutter/material.dart';

class CircleIcon extends StatelessWidget {
  const CircleIcon(
      {super.key, this.icon, this.color, this.onPressed, this.backgoundColor});
  final IconData? icon;
  final Color? color;
  final Color? backgoundColor;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: backgoundColor ??
          color?.withOpacity(0.2) ??
          AColor.blue.withOpacity(0.2),
      child: IconButton(
        color: color ?? AColor.blue,
        icon: Icon(icon ?? AIcons.more_horiz),
        onPressed: onPressed,
      ),
    );
  }
}
