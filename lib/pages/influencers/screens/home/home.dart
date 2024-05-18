import 'package:enfluwence/pages/auth/controllers/homes/home_page_controller.dart';
import 'package:enfluwence/pages/auth/controllers/influencer/influencer_controller.dart';
import 'package:enfluwence/pages/general/general_user.dart';
import 'package:enfluwence/pages/influencers/models/tasks_list.dart';
import 'package:enfluwence/pages/influencers/screens/tasks/campaign/all_campaigns.dart';
import 'package:enfluwence/pages/influencers/screens/tasks/campaign/campaign_list.dart';
import 'package:enfluwence/pages/influencers/screens/tasks/task_button.dart';
import 'package:enfluwence/pages/influencers/screens/home/home_header.dart';
import 'package:enfluwence/pages/influencers/screens/home/totals.dart';
import 'package:enfluwence/pages/influencers/screens/wallet/fund_account_botton.dart';
import 'package:enfluwence/pages/transactions/screens/transactions_list.dart';
import 'package:enfluwence/utills/consts/config.dart';
import 'package:enfluwence/utills/consts/size.dart';
import 'package:enfluwence/utills/popups/small_loading.dart';
import 'package:enfluwence/widgets/containers/card.dart';
import 'package:enfluwence/widgets/containers/page_container.dart';
import 'package:enfluwence/widgets/header/section_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List recentCampaign = Tasks.getCampaign();
    final controller = Get.put(HomePageController());
    final influncerController = Get.put(InfluencerController());
    return PageContainer(
      children: [
        const SizedBox(height: ASizes.md),
        const HomeHeader(),
        ACard(
          child: Column(children: [
            const TaskButton(),
            const SizedBox(height: ASizes.md),
            const FundAccountButton(),
            const SizedBox(height: ASizes.md),
            Obx(() => influncerController.isLoadingRecent.value
                ? SmallLoading()
                : TransactionsList(
                    heading: "Recent Spending",
                    transList: influncerController.spending!.value,
                  )),
          ]),
        ),
        const Totals(),
        SectionHeader(
          title: "Campaign Tasks",
          textButton: "View all",
          textAction: () {
            Get.to(AllCampaings());
          },
        ),
        Obx(() => CampaignList(
              list: influncerController.taskLists.value,
              limit: 5,
              title: "Recent Campaigns,",
            )),
      ],
    );
  }
}
