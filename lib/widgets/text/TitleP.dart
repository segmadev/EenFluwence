import 'package:flutter/material.dart';

class TitleP extends StatelessWidget {
  const TitleP({super.key, required this.title, required this.paragraph});
  final String title;
  final String paragraph;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Theme.of(context).textTheme.titleMedium),
        Text(
          paragraph,
          style: Theme.of(context).textTheme.bodySmall,
        )
      ],
    );
  }
}
