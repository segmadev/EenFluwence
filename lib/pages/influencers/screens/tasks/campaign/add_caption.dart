import 'package:enfluwence/utills/consts/colors.dart';
import 'package:enfluwence/utills/consts/size.dart';
import 'package:enfluwence/widgets/buttons/round_button.dart';
import 'package:enfluwence/widgets/containers/card.dart';
import 'package:enfluwence/widgets/containers/page_container.dart';
import 'package:enfluwence/widgets/header/section_header.dart';
import 'package:enfluwence/widgets/navigation/back_navigation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class AddCaption extends StatefulWidget {
  const AddCaption({super.key});

  @override
  State<AddCaption> createState() => _AddCaptionState();
}

class _AddCaptionState extends State<AddCaption> {
  @override
  Widget build(BuildContext context) {
    String? dropdownValue;
    return BackNavigation(
        body: PageContainer(
      children: [
        const SectionHeader(
          title: 'Social media Campaign',
          paragraph:
              "Create your social media campaign to boost  engagements increase your audience and research etc below.",
        ),
        ACard(
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
                      onPressed: () {},
                      icon: Icon(Icons.delete_rounded),
                      color: AColor.danger)
                ],
              ),
              SizedBox(height: ASizes.spaceBtwInputFields),
              DropdownButtonFormField(
                value: dropdownValue,
                hint: const Text('Select Task type'),
                items: [
                  const DropdownMenuItem(
                      child: Text("Instagram"), value: 'admin'),
                  const DropdownMenuItem(
                      child: Text("Twitter - X"), value: 'user'),
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
        ),
        SizedBox(width: ASizes.spaceBtwInputFields),
        ACard(
            onTap: () {},
            child: Text(
              "+ Add More Caption",
              textAlign: TextAlign.center,
            )),
        ACard(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
                onPressed: () => Get.back(),
                child: Text(
                  "Previous",
                  style: Theme.of(context).textTheme.bodyLarge,
                )),
            SizedBox(width: ASizes.spaceBtwInputFields),
            RoundButton(
              onPressed: () {},
              name: "Next",
            ),
          ],
        ))
      ],
    ));
  }
}
