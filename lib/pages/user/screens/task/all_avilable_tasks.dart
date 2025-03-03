import 'package:enfluwence/pages/user/controllers/user_task_list_controller.dart';
import 'package:enfluwence/pages/user/screens/task/avilable_task_list.dart';
import 'package:enfluwence/pages/user/screens/task/user_single_task.dart';
import 'package:enfluwence/utills/consts/text.dart';
import 'package:enfluwence/widgets/containers/page_container.dart';
import 'package:enfluwence/widgets/header/section_header.dart';
import 'package:enfluwence/widgets/navigation/back_navigation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllAvailableTasks extends StatelessWidget {
  const AllAvailableTasks({super.key});

  @override
  Widget build(BuildContext context) {
    final UserController userController = Get.find();
    return BackNavigation(
      body: PageContainer(
        children: [
          SectionHeader(
            title: AText.tasks,
            textButton: "",
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height - 100,
            child: SingleChildScrollView(
              controller: userController.avilableTasksScrollController,
              child: AvilableTaskList(),
            ),
          ),
        ],
      ),
    );
  }
}
