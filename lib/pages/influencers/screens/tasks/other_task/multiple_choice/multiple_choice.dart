import 'package:enfluwence/pages/influencers/controllers/task_controller.dart';
import 'package:enfluwence/pages/influencers/models/task.dart';
import 'package:enfluwence/pages/influencers/screens/tasks/other_task/multiple_choice/single_choice.dart';
import 'package:enfluwence/utills/consts/colors.dart';
import 'package:enfluwence/utills/consts/size.dart';
import 'package:enfluwence/utills/helpers/helper_functions.dart';
import 'package:enfluwence/utills/validators/validations.dart';
import 'package:enfluwence/widgets/containers/card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MultipleChoice extends StatelessWidget {
  const MultipleChoice({super.key, required this.question});
  final Rx<Question> question;
  @override
  Widget build(BuildContext context) {
    TaskController controller = Get.find();
    return Obx(() => Column(
          children: [
            Column(
              children: question.value.choices!.map((choice) {
                final index = question.value.choices!.indexOf(choice);
                final canRemove = index + 1 > 2 ? true : false;
                final total = question.value.choices!.length;

                bool isLast = (index < (total - 1)) ? false : true;
                return SingleChoice(
                  label: "Option " + (index + 1).toString(),
                  canRemove: canRemove,
                  choice: choice,
                  question: question.value,
                  isLast: isLast,
                );
              }).toList(),
            ),
            // ACard(
            //     onTap: () {
            //       // print("Question: " + question.value.toJson().toString());
            //       controller.addChoice(question.value);
            //     },
            //     child: Center(child: Text("+ add more option")))
          ],
        ));
  }
}

//  Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             ChoiceChip(
//               label: const Text('Apple'),
//               selected: true,
//             ),
//             ChoiceChip(
//               label: const Text('Orange'),
//               selected: false,
//             ),
//             ChoiceChip(
//               selected: false,
//               label: const Text('Banana'),
//             ),
//             ChoiceChip(
//               selected: false,
//               label: const Text('Mango'),
//             ),
//           ],
// )
