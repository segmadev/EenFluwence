import 'package:enfluwence/utills/consts/colors.dart';
import 'package:enfluwence/utills/consts/icons.dart';
import 'package:enfluwence/utills/helpers/helper_functions.dart';
import 'package:enfluwence/widgets/containers/total_card.dart';
import 'package:flutter/material.dart';

class Totals extends StatelessWidget {
  const Totals({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TotalCard(
          title: "Total Campaign",
          value: "20",
          icon: AIcons.campaigns,
          iconColor: AColor.darkSuccess,
          iconBackground: AColor.lightSuccess.withOpacity(0.2),
        ),
        TotalCard(
          title: "Total Spendings",
          value: AHelperFunctions.moneyFormart(100000, withColor: false),
          icon: AIcons.campaigns,
          iconColor: AColor.blue,
          iconBackground: AColor.blue.withOpacity(0.1),
        ),
      ],
    );
  }
}
