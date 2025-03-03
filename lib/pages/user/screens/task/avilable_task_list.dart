import 'package:enfluwence/pages/influencers/models/tasks.dart';
import 'package:enfluwence/pages/influencers/screens/tasks/campaign/single_campaign.dart';
import 'package:enfluwence/pages/user/controllers/user_task_list_controller.dart';
import 'package:enfluwence/pages/user/screens/task/user_single_task.dart';
import 'package:enfluwence/utills/popups/small_loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AvilableTaskList extends StatelessWidget {
  const AvilableTaskList({super.key, this.title, this.limit = 0});
  final String? title;
  final int limit;

  @override
  Widget build(BuildContext context) {
    final UserController userController = Get.find();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title ?? "", style: Theme.of(context).textTheme.bodySmall),
        Obx(() => (!userController.isLoadingTasks.value)
            ? Column(
                children: userController.taskLists.value
                    .take(limit > 0
                        ? limit
                        : userController.taskLists.value.length)
                    .map((task) {
                  return USingleTask(
                    task: task,
                  );
                }).toList(),
              )
            : const SmallLoading()),
      ],
    );
  }
}
