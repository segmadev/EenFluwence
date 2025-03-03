import 'package:enfluwence/pages/influencers/controllers/influencer_task_controller.dart';
import 'package:enfluwence/pages/general/models/task.dart';
import 'package:enfluwence/utills/consts/colors.dart';
import 'package:enfluwence/utills/consts/size.dart';
import 'package:enfluwence/utills/helpers/helper_functions.dart';
import 'package:enfluwence/utills/validators/validations.dart';
import 'package:enfluwence/widgets/buttons/primary_button.dart';
import 'package:enfluwence/widgets/buttons/round_button.dart';
import 'package:enfluwence/widgets/containers/card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CaptionForm extends StatefulWidget {
  const CaptionForm({super.key});
  @override
  State<CaptionForm> createState() => _CaptionFormState();
}

class _CaptionFormState extends State<CaptionForm> {
  final taskController = Get.find<TaskController>();

  get index => this.index;
  @override
  Widget build(BuildContext context) {
    String? dropdownValue;
    return ACard(
      child: Form(
        key: taskController.captionFromKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Task Caption",
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ],
            ),
            SizedBox(height: ASizes.spaceBtwInputFields),
            DropdownButtonFormField(
              validator: (value) =>
                  AValidator.validateEmptyText("Social Media Platform", value),
              value: taskController.socialMedia!.value,
              hint: const Text('Select Social Media'),
              items: [
                const DropdownMenuItem(
                    child: Text("Select Platfrom"), value: ''),
                const DropdownMenuItem(
                    child: Text("Instagram"), value: 'Instagram'),
                const DropdownMenuItem(
                    child: Text("Twitter - X"), value: 'Twitter'),
              ],
              onChanged: (String? newValue) {
                setState(() {
                  taskController.socialMedia!.value = newValue!;
                });
              },
            ),
            SizedBox(height: ASizes.spaceBtwInputFields),

            // input fileds goes here
            TextFormField(
              controller: taskController.text,
              validator: (value) =>
                  AValidator.validateEmptyText("Title", value),
              decoration: const InputDecoration(
                  labelText: "Title",
                  hintStyle:
                      TextStyle(color: Color.fromARGB(146, 158, 158, 158))),
            ),
            SizedBox(height: ASizes.spaceBtwInputFields),
            TextFormField(
              controller: taskController.url,
              validator: (value) => AValidator.validateUrl(value),
              decoration: const InputDecoration(
                  labelText: "Url",
                  suffixIcon: Icon(Icons.link),
                  // suffixIconColor: AColor.darkSuccess,
                  hintStyle:
                      TextStyle(color: Color.fromARGB(146, 158, 158, 158))),
            ),
            // input fileds goes here

            SizedBox(height: ASizes.spaceBtwInputFields),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RoundButton(
                  onPressed: () {
                    taskController.addCaption();
                  },
                  name: "Add Caption",
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
