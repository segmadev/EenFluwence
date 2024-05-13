import 'package:enfluwence/pages/auth/controllers/influencer/influencer_controller.dart';
import 'package:enfluwence/pages/influencers/models/tasks_list.dart';
import 'package:enfluwence/pages/influencers/screens/tasks/campaign/all_campaigns.dart';
import 'package:enfluwence/pages/influencers/screens/tasks/campaign/campaign_list.dart';
import 'package:enfluwence/pages/influencers/screens/tasks/task_button.dart';
import 'package:enfluwence/pages/influencers/screens/home/home_header.dart';
import 'package:enfluwence/pages/influencers/screens/home/totals.dart';
import 'package:enfluwence/utills/consts/size.dart';
import 'package:enfluwence/utills/consts/text.dart';
import 'package:enfluwence/widgets/containers/page_container.dart';
import 'package:enfluwence/widgets/header/section_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class CampaignScreen extends StatelessWidget {
  const CampaignScreen({super.key});

  @override
  Widget build(BuildContext context) {
    InfluencerController controller = Get.find();
    return PageContainer(
      children: [
        const SizedBox(height: ASizes.md),
        const HomeHeader(),
        const SizedBox(height: ASizes.md),
        const TaskButton(),
        const SizedBox(height: ASizes.md),
        const Totals(),
        SectionHeader(
          title: AText.campaignTask,
          textButton: "View All",
          textAction: () {
            Get.to(const AllCampaings());
          },
        ),
        CampaignList(
          list: controller.taskLists.value,
          limit: 5,
        ),
      ],
    );
  }
}
