import 'package:enfluwence/pages/influencers/controllers/task_controller.dart';
import 'package:enfluwence/pages/influencers/models/task.dart';
import 'package:enfluwence/utills/consts/colors.dart';
import 'package:enfluwence/utills/consts/size.dart';
import 'package:enfluwence/widgets/containers/card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CaptionForm extends StatefulWidget {
  const CaptionForm({super.key, required this.caption});
  final Caption caption;
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
              IconButton(
                  onPressed: () {
                    taskController.removeCaption(index: widget.caption.index!);
                  },
                  icon: Icon(Icons.delete_rounded),
                  color: AColor.danger)
            ],
          ),
          SizedBox(height: ASizes.spaceBtwInputFields),
          DropdownButtonFormField(
            value: dropdownValue,
            hint: const Text('Select Task type'),
            items: [
              const DropdownMenuItem(child: Text("Instagram"), value: 'admin'),
              const DropdownMenuItem(child: Text("Twitter - X"), value: 'user'),
            ],
            onChanged: (String? newValue) {
              setState(() {
                dropdownValue = newValue!;
              });
            },
          ),
          SizedBox(height: ASizes.spaceBtwInputFields),

          // input fileds goes here
          TextFormField(
            decoration: const InputDecoration(
                labelText: "Title",
                hintStyle:
                    TextStyle(color: Color.fromARGB(146, 158, 158, 158))),
          ),
          SizedBox(height: ASizes.spaceBtwInputFields),
          TextFormField(
            decoration: const InputDecoration(
                labelText: "Url",
                suffixIcon: Icon(Icons.check_circle_rounded),
                suffixIconColor: AColor.darkSuccess,
                hintStyle:
                    TextStyle(color: Color.fromARGB(146, 158, 158, 158))),
          ),
          // input fileds goes here

          SizedBox(height: ASizes.spaceBtwInputFields),
        ],
      ),
    );
  }
}
