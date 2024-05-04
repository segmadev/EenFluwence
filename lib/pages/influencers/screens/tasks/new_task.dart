import 'package:enfluwence/pages/influencers/controllers/task_controller.dart';
import 'package:enfluwence/pages/influencers/screens/tasks/task_audience.dart';
import 'package:enfluwence/utills/consts/colors.dart';
import 'package:enfluwence/utills/consts/size.dart';
import 'package:enfluwence/utills/validators/validations.dart';
import 'package:enfluwence/widgets/buttons/round_button.dart';
import 'package:enfluwence/widgets/containers/card.dart';
import 'package:enfluwence/widgets/containers/page_container.dart';
import 'package:enfluwence/widgets/header/section_header.dart';
import 'package:enfluwence/widgets/navigation/back_navigation.dart';
import 'package:enfluwence/widgets/navigation/navigation_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    final controller = Get.put(TaskController());
    return BackNavigation(
        body: PageContainer(
      children: [
        const SectionHeader(
          title: 'New Task',
          paragraph:
              "Select Task type and Choose the number of people that will engage your campaign. This affects the amount you’ll be required to conduct said task.",
        ),
        // const ACard(
        //   child: Text(
        //     "Choose Type of Task",
        //     textAlign: TextAlign.center,
        //   ),
        // ),
        ACard(
            child: Form(
          key: controller.taskFromKey,
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
                validator: (value) =>
                    AValidator.validateEmptyText("Task Type", value),
                value: controller.taskType,
                hint: const Text('Select Task type'),
                items: [
                  const DropdownMenuItem(
                      child: Text("Social Media Campaign"),
                      value: 'Social Media Campaign'),
                  const DropdownMenuItem(
                      child: Text("Other Task"), value: 'Other Tasks'),
                ],
                onChanged: (String? newValue) {
                  setState(() {
                    controller.taskType = newValue!;
                  });
                },
              ),
              SizedBox(height: ASizes.spaceBtwInputFields),
              Text(
                "Add amount for an engagement",
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              SizedBox(height: ASizes.spaceBtwInputFields),
              TextFormField(
                validator: (value) =>
                    AValidator.validateEmptyText("Amount", value),
                controller: controller.costPerEngagement,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                decoration: const InputDecoration(
                    labelText: "100",
                    prefixText: "NGN",
                    prefixStyle: TextStyle(color: AColor.darkSuccess),
                    hintStyle:
                        TextStyle(color: Color.fromARGB(146, 158, 158, 158))),
              ),
              SizedBox(height: ASizes.spaceBtwInputFields),
              Text(
                "Number of engagement",
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              SizedBox(height: ASizes.spaceBtwInputFields),
              // input fileds goes here
              TextFormField(
                validator: (value) =>
                    AValidator.validateEmptyText("Number of Engagement", value),
                controller: controller.totalNumberOfEngagements,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                decoration: const InputDecoration(
                    labelText: "100",
                    hintStyle:
                        TextStyle(color: Color.fromARGB(146, 158, 158, 158))),
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
                      controller.create_new_task();
                    },
                  ),
                ],
              )
            ],
          ),
        ))
      ],
    ));
  }
}
