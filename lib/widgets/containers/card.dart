import 'package:enfluwence/utills/consts/colors.dart';
import 'package:enfluwence/utills/consts/size.dart';
import 'package:enfluwence/utills/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class ACard extends StatelessWidget {
  const ACard({
    super.key,
    required this.child,
    this.width = double.infinity,
    this.backgroundColor,
    this.padding,
    this.onTap,
    this.topHeight,
    this.height,
    this.border,
  });
  final Widget child;
  final double width;
  final double? height;
  final Color? backgroundColor;
  final double? padding;
  final dynamic? onTap;
  final double? topHeight;
  final Border? border;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: topHeight ?? ASizes.md),
        InkWell(
          onTap: onTap,
          child: Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              color: backgroundColor ??
                  AHelperFunctions.getCardBackgroundColor(context),
              borderRadius: BorderRadius.circular(ASizes.borderRadiusLg),
              border: border,
            ),
            child: Padding(
              padding: EdgeInsets.all(padding ?? ASizes.md),
              child: child,
            ),
          ),
        )
      ],
    );
  }
}
