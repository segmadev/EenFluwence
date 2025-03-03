import 'dart:ffi';

import 'package:enfluwence/pages/influencers/controllers/influencer_task_controller.dart';
import 'package:enfluwence/pages/general/models/task.dart';
import 'package:enfluwence/pages/influencers/screens/tasks/other_task/fixed_bottom.dart';
import 'package:enfluwence/pages/influencers/screens/tasks/other_task/multiple_choice/multiple_choice.dart';
import 'package:enfluwence/pages/influencers/screens/tasks/other_task/questions/single_question.dart';
import 'package:enfluwence/utills/consts/colors.dart';
import 'package:enfluwence/utills/consts/size.dart';
import 'package:enfluwence/utills/validators/validations.dart';
import 'package:enfluwence/widgets/containers/card.dart';
import 'package:enfluwence/widgets/containers/page_container.dart';
import 'package:enfluwence/widgets/header/section_header.dart';
import 'package:enfluwence/widgets/navigation/back_navigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AddQuestions extends StatefulWidget {
  const AddQuestions({super.key});

  @override
  State<AddQuestions> createState() => _AddQuestionsState();
}

class _AddQuestionsState extends State<AddQuestions> {
  @override
  Widget build(BuildContext context) {
    TaskController taskController = Get.find();
    return BackNavigation(
      body: PageContainer(
        children: [
          const SectionHeader(
            title: 'Other Task',
          ),

          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height - 200,
            child: Form(
              key: taskController.questionFromKey,
              child: Obx(() => Column(
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          controller: taskController.questionScrollController,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: Column(
                            children: taskController.taskData.value.questions!
                                .map((data) {
                              final index = taskController
                                  .taskData.value.questions!
                                  .indexOf(data);

                              return SingleQuestion(
                                question: data,
                                index: index,
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
          ),

          FixedBottom(),

          // Align(
          //   alignment: Alignment.bottomCenter,
          //   child: ACard(

          //       child: Center(child: Text("add a new Question"))),
          // ),
        ],
      ),
    );
  }
}
