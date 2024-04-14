import 'package:flutter/material.dart';

class PrimayButton extends StatelessWidget {
  const PrimayButton({
    super.key,
    required this.name,
    this.onclick,
  });
  final String name;
  final void Function()? onclick;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onclick ?? () {},
        child: Text(name),
      ),
    );
  }
}
