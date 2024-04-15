import 'package:enfluwence/utills/consts/colors.dart';
import 'package:enfluwence/utills/consts/size.dart';
import 'package:enfluwence/utills/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class ACard extends StatelessWidget {
  const ACard({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    var isDark = AHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        const SizedBox(height: ASizes.md),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: isDark ? AColor.black.withOpacity(0.3) : AColor.white,
            borderRadius: BorderRadius.circular(ASizes.borderRadiusLg),
          ),
          child: Padding(
            padding: const EdgeInsets.all(ASizes.md),
            child: child,
          ),
        )
      ],
    );
  }
}
