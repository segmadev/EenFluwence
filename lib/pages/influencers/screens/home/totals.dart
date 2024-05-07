import 'package:enfluwence/pages/auth/controllers/influencer/influencer_controller.dart';
import 'package:enfluwence/utills/consts/colors.dart';
import 'package:enfluwence/utills/consts/icons.dart';
import 'package:enfluwence/utills/helpers/helper_functions.dart';
import 'package:enfluwence/widgets/containers/total_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Totals extends StatelessWidget {
  const Totals({super.key});

  @override
  Widget build(BuildContext context) {
    final InfluencerController influencerController = Get.find();
    return Obx(
      () => Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        TotalCard(
          title: "Total Task",
          value: influencerController.noOfTasks.value,
          icon: AIcons.campaigns,
          iconColor: AColor.darkSuccess,
          iconBackground: AColor.lightSuccess.withOpacity(0.2),
        ),
        TotalCard(
          title: "Total Spendings",
          value: AHelperFunctions.moneyFormart(
              influencerController.totalMoneySpent.value,
              withColor: false),
          icon: AIcons.campaigns,
          iconColor: AColor.blue,
          iconBackground: AColor.blue.withOpacity(0.1),
        ),
      ]),
    );
  }
}
