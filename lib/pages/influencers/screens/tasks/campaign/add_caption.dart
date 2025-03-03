import 'package:enfluwence/pages/influencers/controllers/influencer_task_controller.dart';
import 'package:enfluwence/pages/general/models/task.dart';
import 'package:enfluwence/pages/influencers/screens/tasks/campaign/caption_form.dart';
import 'package:enfluwence/pages/influencers/screens/tasks/campaign/single_caption.dart';
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
    final TaskController taskController = Get.find();
    RxList<Caption> captionList = taskController.captionList;

    String? dropdownValue;
    return BackNavigation(
        body: PageContainer(
      children: [
        const SectionHeader(
          title: 'Social media Campaign',
          paragraph:
              "Create your social media campaign to boost  engagements increase your audience and research etc below.",
        ),
        Obx(() => Column(
              children: [
                CaptionForm(),
                SizedBox(height: ASizes.spaceBtwInputFields),
                captionList.length > 0
                    ? RoundButton(
                        width: double.infinity,
                        color: AColor.darkSuccess,
                        onPressed: () {
                          taskController.publishTask();
                        },
                        name: "Publish",
                      )
                    : SizedBox(),
                Column(
                  children: captionList.map((caption) {
                    var index = captionList.indexOf(caption);
                    return SingleCaption(
                      caption: caption,
                    );
                  }).toList(),
                ),
              ],
            )),

        // ACard(
        //     child: Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     TextButton(
        //         onPressed: () => Get.back(),
        //         child: Text(
        //           "Previous",
        //           style: Theme.of(context).textTheme.bodyLarge,
        //         )),
        //     SizedBox(width: ASizes.spaceBtwInputFields),
        //     RoundButton(
        //       onPressed: () {},
        //       name: "Next",
        //     ),
        //   ],
        // ))
      ],
    ));
  }
}
