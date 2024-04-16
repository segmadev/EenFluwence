import 'package:enfluwence/utills/consts/size.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.name,
    this.onPressed,
    this.width,
    this.height,
    this.backgroundColor,
    this.color,
  });
  final String name;
  final void Function()? onPressed;
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? null,
      child: ElevatedButton(
        style:
            ElevatedButton.styleFrom(backgroundColor: backgroundColor ?? null),
        onPressed: onPressed ?? () {},
        child: Text(
          name,
          style: TextStyle(color: color ?? null),
        ),
      ),
    );
  }
}
