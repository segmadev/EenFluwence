import 'package:enfluwence/pages/influencers/controllers/influencer_task_controller.dart';
import 'package:enfluwence/pages/general/models/task.dart';
import 'package:enfluwence/utills/consts/colors.dart';
import 'package:enfluwence/utills/consts/icons.dart';
import 'package:enfluwence/utills/consts/size.dart';
import 'package:enfluwence/utills/helpers/helper_functions.dart';
import 'package:enfluwence/utills/validators/validations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SingleChoice extends StatelessWidget {
  const SingleChoice(
      {super.key,
      this.canRemove = true,
      this.value,
      this.label = "Option",
      required this.choice,
      required this.question,
      this.isLast = false});
  final bool canRemove;
  final String? value;
  final String label;
  final Choice choice;
  final Question question;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    TaskController controller = Get.find();
    return Column(
      children: [
        SizedBox(
          height: ASizes.spaceBtwInputFields,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: AHelperFunctions.screenWidth() - (!isLast ? 130 : 160),
              child: TextFormField(
                validator: (value) =>
                    AValidator.validateEmptyText(label, value),
                onChanged: (newChoiceValue) {
                  choice.text = newChoiceValue;
                },
                initialValue: choice.text,
                decoration: InputDecoration(
                  labelText: label,
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.remove_circle),
              onPressed: !canRemove
                  ? null
                  : () {
                      controller.removeChoice(choice, question);
                    },
              color: AColor.danger,
              disabledColor: AColor.danger.withOpacity(0.2),
            ),
            isLast
                ? IconButton(
                    onPressed: () {
                      controller.addChoice(question);
                    },
                    color: AColor.darkSuccess,
                    icon: Icon(
                      AIcons.plus,
                    ))
                : const SizedBox(),
          ],
        ),
      ],
    );
  }
}
