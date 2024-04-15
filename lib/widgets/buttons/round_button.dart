import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  const RoundButton({
    super.key,
    this.name = "submit",
    this.onPressed,
    this.color,
    this.child,
  });
  final String name;
  final void Function()? onPressed;
  final Color? color;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: color ?? Theme.of(context).primaryColor,
          onPrimary: color != null
              ? color?.withOpacity(0.7)
              : Theme.of(context).primaryColor.withOpacity(0.7),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        onPressed: onPressed ?? () {},
        child: Center(
            child: child != null
                ? child
                : Text(name, style: Theme.of(context).textTheme.labelMedium)),
      ),
    );
  }
}
