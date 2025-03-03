import 'package:enfluwence/pages/influencers/controllers/influencer_task_controller.dart';
import 'package:enfluwence/utills/consts/colors.dart';
import 'package:enfluwence/widgets/buttons/primary_button.dart';
import 'package:enfluwence/widgets/containers/card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FixedBottom extends StatelessWidget {
  const FixedBottom({super.key});

  @override
  Widget build(BuildContext context) {
    TaskController controller = Get.find();
    return ACard(
        padding: 10,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ACard(
                onTap: () {
                  if (controller.addQuestion()) {
                    controller.questionScrollController.animateTo(
                      controller
                          .questionScrollController.position.maxScrollExtent,
                      curve: Curves.easeOut,
                      duration: const Duration(milliseconds: 300),
                    );
                  }
                },
                topHeight: 0,
                width: 150,
                padding: 10,
                backgroundColor: AColor.darkSuccess.withOpacity(0.2),
                child: Center(child: Text("+ Add Question"))),
            PrimaryButton(
              onPressed: () {
                controller.publishTask();
              },
              width: 120,
              name: "Publish Task",
              backgroundColor: AColor.darkSuccess,
            ),
          ],
        ));
  }
}
