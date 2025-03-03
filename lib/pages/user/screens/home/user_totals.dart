import 'package:enfluwence/pages/user/controllers/user_task_list_controller.dart';
import 'package:enfluwence/utills/consts/colors.dart';
import 'package:enfluwence/utills/consts/icons.dart';
import 'package:enfluwence/utills/consts/text.dart';
import 'package:enfluwence/utills/helpers/helper_functions.dart';
import 'package:enfluwence/widgets/containers/total_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UTotals extends StatelessWidget {
  const UTotals({super.key});

  @override
  Widget build(BuildContext context) {
    UserController userController = Get.find();
    return Obx(
      () => Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        TotalCard(
          title: AText.eranings,
          value: userController.earnings.value,
          icon: AIcons.chart,
          iconColor: AColor.darkSuccess,
          iconBackground: AColor.lightSuccess.withOpacity(0.2),
        ),
        TotalCard(
          title: AText.expenditure,
          value: AHelperFunctions.moneyFormart(userController.expenditure.value,
              withColor: false),
          icon: AIcons.wallet,
          iconColor: AColor.danger,
          iconBackground: AColor.danger.withOpacity(0.1),
        ),
      ]),
    );
  }
}
