import 'package:enfluwence/pages/influencers/models/tasks.dart';
import 'package:enfluwence/pages/influencers/screens/tasks/campaign/campaign_list.dart';
import 'package:enfluwence/pages/influencers/screens/tasks/task_button.dart';
import 'package:enfluwence/pages/influencers/screens/home/home_header.dart';
import 'package:enfluwence/pages/influencers/screens/home/totals.dart';
import 'package:enfluwence/utills/consts/size.dart';
import 'package:enfluwence/utills/consts/text.dart';
import 'package:enfluwence/widgets/containers/page_container.dart';
import 'package:enfluwence/widgets/header/section_header.dart';
import 'package:flutter/material.dart';

class CampaignScreen extends StatelessWidget {
  const CampaignScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List campaignList = Tasks.getCampaign();
    return PageContainer(
      children: [
        const SizedBox(height: ASizes.md),
        const HomeHeader(),
        const SizedBox(height: ASizes.md),
        const TaskButton(),
        const SizedBox(height: ASizes.md),
        const Totals(),
        const SectionHeader(
          title: AText.campaignTask,
        ),
        CampaignList(
          list: campaignList,
          title: "Today,",
          
        ),
      ],
    );
  }
}
