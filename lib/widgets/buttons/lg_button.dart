import 'package:enfluwence/utills/consts/size.dart';
import 'package:flutter/material.dart';

class LgButton extends StatelessWidget {
  const LgButton({
    super.key,
    this.name = "Submit",
    this.onPressed,
    this.child,
  });
  final String name;
  final Widget? child;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed ?? () {},
        child: Padding(
          padding: const EdgeInsets.all(ASizes.md),
          child: Center(child: child != null ? child : Text(name)),
        ),
      ),
    );
  }
}
