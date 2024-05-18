import 'package:enfluwence/utills/consts/colors.dart';
import 'package:enfluwence/utills/consts/size.dart';
import 'package:enfluwence/utills/helpers/helper_functions.dart';
import 'package:enfluwence/widgets/containers/card.dart';
import 'package:flutter/material.dart';

class ABadge extends StatelessWidget {
  const ABadge({super.key, required this.label, this.color, this.width});
  final String label;
  final Color? color;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return ACard(
      topHeight: 0.0,
      child: Text(
        label,
        textAlign: TextAlign.center,
        style: TextStyle(color: color ?? null, fontSize: ASizes.fontSizeSm),
      ),
      width: width ?? 120,
      backgroundColor: color != null
          ? color!.withOpacity(0.4)
          : AHelperFunctions.getCardBackgroundColor(context),
      padding: ASizes.sm,
    );
  }
}
