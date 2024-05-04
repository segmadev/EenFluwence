import 'package:enfluwence/pages/influencers/screens/tasks/new_task.dart';
import 'package:enfluwence/utills/consts/asset_paths.dart';
import 'package:enfluwence/utills/consts/icons.dart';
import 'package:enfluwence/utills/consts/text.dart';
import 'package:enfluwence/widgets/buttons/lg_button.dart';
import 'package:enfluwence/widgets/pages/success_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TaskButton extends StatelessWidget {
  const TaskButton({super.key});

  @override
  Widget build(BuildContext context) {
    return LgButton(
      onPressed: () {
        Get.to(const NewTask());
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Icon(AIcons.plus), Text(AText.createTask)],
      ),
    );
  }
}
