import 'package:enfluwence/pages/influencers/screens/tasks/campaign/add_caption.dart';
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

class TaskAudience extends StatelessWidget {
  const TaskAudience({super.key});

  @override
  Widget build(BuildContext context) {
    return BackNavigation(
        body: PageContainer(
      children: [
        const SectionHeader(
          title: 'Choose your Audience',
          paragraph:
              "Choose the number of people that will engage your campaign. This affects the amount you’ll be required to conduct said task.",
        ),
        ACard(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Add amount for an engagement",
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            SizedBox(height: ASizes.spaceBtwInputFields),
            // input fileds goes here
            TextFormField(
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
                    onPressed: () => Get.back(),
                    child: Text(
                      "Previous",
                      style: Theme.of(context).textTheme.bodyLarge,
                    )),
                SizedBox(width: ASizes.spaceBtwInputFields),
                RoundButton(
                  onPressed: () {
                    Get.to(const AddCaption());
                  },
                  name: "Next",
                ),
              ],
            )
          ],
        ))
      ],
    ));
  }
}
