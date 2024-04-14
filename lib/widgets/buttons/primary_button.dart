import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.name,
    this.onPressed,
  });
  final String name;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
      onPressed: onPressed ?? () {},
        child: Text(name),
      ),
    );
  }
}
