import 'package:enfluwence/utills/consts/size.dart';
import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader(
      {super.key,
      required this.title,
      this.textButton,
      this.textAction,
      this.paragraph});
  final String title;
  final String? textButton;
  final void Function()? textAction;
  final String? paragraph;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          SizedBox(
            height: ASizes.md,
          ),
          Row(
            mainAxisAlignment: textButton != null
                ? MainAxisAlignment.spaceBetween
                : MainAxisAlignment.center,
            children: [
              Text(title, style: Theme.of(context).textTheme.headlineSmall),
              (textButton != null)
                  ? TextButton(
                      onPressed: textAction ?? () {},
                      child: Text(textButton!,
                          style: Theme.of(context).textTheme.labelSmall),
                    )
                  : Text(""),
            ],
          ),
          paragraph != null
              ? Column(
                  children: [
                    SizedBox(
                      height: ASizes.sm,
                    ),
                    Text(
                      paragraph ?? "",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                )
              : SizedBox(),
          SizedBox(
            height: ASizes.md,
          ),
        ],
      ),
    );
  }
}
