import 'package:enfluwence/pages/influencers/screens/tasks/task_audience.dart';
import 'package:enfluwence/utills/consts/colors.dart';
import 'package:enfluwence/utills/consts/size.dart';
import 'package:enfluwence/widgets/buttons/round_button.dart';
import 'package:enfluwence/widgets/containers/card.dart';
import 'package:enfluwence/widgets/containers/page_container.dart';
import 'package:enfluwence/widgets/header/section_header.dart';
import 'package:enfluwence/widgets/navigation/back_navigation.dart';
import 'package:enfluwence/widgets/navigation/navigation_menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewTask extends StatefulWidget {
  const NewTask({super.key});

  @override
  State<NewTask> createState() => _NewTaskState();
}

class _NewTaskState extends State<NewTask> {
  @override
  Widget build(BuildContext context) {
    String? dropdownValue;
    return BackNavigation(
        body: PageContainer(
      children: [
        const SectionHeader(
          title: 'New Task',
          paragraph:
              "Choose the number of people that will engage your campaign. This affects the amount you’ll be required to conduct said task.",
        ),
        const ACard(
          child: Text(
            "Choose Type of Task",
            textAlign: TextAlign.center,
          ),
        ),
        ACard(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Task Type",
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            SizedBox(height: ASizes.spaceBtwInputFields),
            DropdownButtonFormField(
              value: dropdownValue,
              hint: const Text('Select Task type'),
              items: [
                const DropdownMenuItem(
                    child: Text("Social Media Campaign"), value: 'admin'),
                const DropdownMenuItem(
                    child: Text("Other Task"), value: 'user'),
              ],
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue = newValue!;
                });
              },
            ),
            SizedBox(height: ASizes.spaceBtwInputFields),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "Cancel",
                      style: Theme.of(context).textTheme.bodyLarge,
                    )),
                SizedBox(width: ASizes.spaceBtwInputFields),
                RoundButton(
                  name: "Next",
                  onPressed: () {
                    Get.to(const TaskAudience());
                  },
                ),
              ],
            )
          ],
        ))
      ],
    ));
  }
}
