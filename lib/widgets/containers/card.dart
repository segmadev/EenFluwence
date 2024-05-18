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
  });
  final Widget child;
  final double width;
  final double? height;
  final Color? backgroundColor;
  final double? padding;
  final dynamic? onTap;
  final double? topHeight;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: topHeight ?? ASizes.md),
        InkWell(
          onTap: onTap,
          child: Container(
            width: width,
            height: height ?? null,
            decoration: BoxDecoration(
              color: backgroundColor ??
                  AHelperFunctions.getCardBackgroundColor(context),
              borderRadius: BorderRadius.circular(ASizes.borderRadiusLg),
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
