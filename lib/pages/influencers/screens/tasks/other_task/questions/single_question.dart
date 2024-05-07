import 'package:enfluwence/pages/influencers/controllers/task_controller.dart';
import 'package:enfluwence/pages/influencers/models/task.dart';
import 'package:enfluwence/pages/influencers/screens/tasks/other_task/multiple_choice/multiple_choice.dart';
import 'package:enfluwence/utills/consts/colors.dart';
import 'package:enfluwence/utills/consts/icons.dart';
import 'package:enfluwence/utills/consts/size.dart';
import 'package:enfluwence/utills/validators/validations.dart';
import 'package:enfluwence/widgets/buttons/primary_button.dart';
import 'package:enfluwence/widgets/containers/card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SingleQuestion extends StatefulWidget {
  const SingleQuestion(
      {super.key, required this.question, required this.index});
  final Question question;
  final int index;

  @override
  State<SingleQuestion> createState() => _SingleQuestionState();
}

class _SingleQuestionState extends State<SingleQuestion> {
  @override
  Widget build(BuildContext context) {
    Rx<Question> question = widget.question.obs;
    TaskController controller = Get.find();
    return ACard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Question " + (widget.index + 1).toString(),
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              IconButton(
                  onPressed: widget.index > 0
                      ? () {
                          controller.removeQuestion(question.value);
                        }
                      : null,
                  disabledColor: AColor.danger.withOpacity(0.3),
                  color: AColor.danger,
                  icon: Icon(
                    AIcons.delete,
                  ))
            ],
          ),
          SizedBox(height: ASizes.spaceBtwInputFields),

          // input fileds goes here
          TextFormField(
            initialValue: question.value.question,
            validator: (value) =>
                AValidator.validateEmptyText("Question", value),

            onChanged: (newQuestionValue) {
              setState(() {
                question.value.question = newQuestionValue;
              });
            },
            decoration: const InputDecoration(
                labelText: "Start Typing your question",
                hintStyle:
                    TextStyle(color: Color.fromARGB(146, 158, 158, 158))),
            keyboardType: TextInputType.multiline,
            minLines: 1, // <-- SEE HERE
            maxLines: 5,
          ),
          SizedBox(height: ASizes.spaceBtwInputFields),
          DropdownButtonFormField(
            validator: (value) =>
                AValidator.validateEmptyText("Answer Type", value),
            value: question.value.answerType,
            hint: const Text('Select Answer Type'),
            items: [
              const DropdownMenuItem(
                  child: Text("Select Answer Type"), value: ''),
              const DropdownMenuItem(
                  child: Text("Short Answer"), value: 'Short Answer'),
              const DropdownMenuItem(
                  child: Text("Multiple Choice"), value: 'Multiple Choice'),
              const DropdownMenuItem(
                  child: Text("Paragraph"), value: 'Paragraph'),
            ],
            onChanged: (String? newValue) {
              setState(() {
                question.value.answerType = newValue!;
              });
            },
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              question.value.answerType == "Multiple Choice"
                  ? MultipleChoice(
                      question: question,
                    )
                  : SizedBox(),
              SizedBox(height: ASizes.spaceBtwInputFields),
            ],
          )
        ],
      ),
    );
  }
}
