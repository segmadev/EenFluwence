import 'package:enfluwence/pages/user/controllers/user_task_list_controller.dart';
import 'package:enfluwence/pages/user/screens/task/all_avilable_tasks.dart';
import 'package:enfluwence/pages/user/screens/task/avilable_task_list.dart';
import 'package:enfluwence/pages/user/screens/home/user_card.dart';
import 'package:enfluwence/pages/user/screens/home/user_totals.dart';
import 'package:enfluwence/pages/user/screens/task/user_single_task.dart';
import 'package:enfluwence/utills/consts/config.dart';
import 'package:enfluwence/utills/consts/size.dart';
import 'package:enfluwence/utills/consts/text.dart';
import 'package:enfluwence/widgets/containers/page_container.dart';
import 'package:enfluwence/widgets/header/section_header.dart';
import 'package:enfluwence/widgets/text/TitleP.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UHomeScreen extends StatelessWidget {
  const UHomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final userController = Get.put(UserController());
    return PageContainer(
      children: [
        const SizedBox(height: ASizes.defaultSpace),
        TitleP(
          title: AText.overview,
          titleStyle: Theme.of(context).textTheme.titleLarge,
        ),
        const UserCard(),
        const UTotals(),
        const SizedBox(height: ASizes.defaultSpace),
        SectionHeader(
          title: AText.avilableTasks,
          textButton: AText.viewAll,
          textAction: () {
            Get.to(const AllAvailableTasks());
          },
        ),
        AvilableTaskList(limit: AConfig.noOfFetch),
      ],
    );
  }
}
