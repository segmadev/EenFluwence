import 'package:enfluwence/utills/consts/colors.dart';
import 'package:enfluwence/utills/consts/size.dart';
import 'package:enfluwence/utills/helpers/helper_functions.dart';
import 'package:enfluwence/widgets/containers/card.dart';
import 'package:flutter/material.dart';

class ABadge extends StatelessWidget {
  const ABadge({super.key, required this.label, this.color});
  final String label;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return ACard(
      child: Text(
        label,
        textAlign: TextAlign.center,
        style: TextStyle(color: color ?? null, fontSize: ASizes.fontSizeSm),
      ),
      width: 120,
      backgroundColor: color != null
          ? color!.withOpacity(0.2)
          : AHelperFunctions.getCardBackgroundColor(context),
      padding: ASizes.sm,
    );
  }
}
