import 'package:enfluwence/utills/consts/colors.dart';
import 'package:enfluwence/utills/consts/icons.dart';
import 'package:enfluwence/utills/consts/size.dart';
import 'package:enfluwence/utills/helpers/helper_functions.dart';
import 'package:enfluwence/widgets/containers/CircleIcon.dart';
import 'package:enfluwence/widgets/containers/card.dart';
import 'package:flutter/material.dart';

class TotalCard extends StatelessWidget {
  const TotalCard(
      {super.key,
      this.textColor,
      required this.title,
      required this.value,
      this.icon,
      this.iconBackground,
      this.iconColor,
      this.backgroudColor});
  final Color? textColor;
  final dynamic title;
  final dynamic value;
  final IconData? icon;
  final Color? iconBackground;
  final Color? iconColor;
  final Color? backgroudColor;
  @override
  Widget build(BuildContext context) {
    return ACard(
        backgroundColor:
            backgroudColor ?? AHelperFunctions.getCardBackgroundColor(context),
        width: (AHelperFunctions.screenWidth() / 2) - (ASizes.defaultSpace + 6),
        child: Row(children: [
          CircleIcon(
            color: iconColor,
            icon: icon,
            backgoundColor: iconBackground,
          ),
          const SizedBox(width: ASizes.sm),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.labelMedium,
                overflow: TextOverflow.clip,
              ),
              Text(
                value.toString(),
                style: Theme.of(context).textTheme.headlineSmall,
                overflow: TextOverflow.clip,
              )
            ],
          ),
        ]));
  }
}
