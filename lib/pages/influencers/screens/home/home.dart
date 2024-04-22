import 'package:enfluwence/pages/influencers/models/tasks.dart';
import 'package:enfluwence/pages/influencers/screens/tasks/campaign/campaign_list.dart';
import 'package:enfluwence/pages/influencers/screens/tasks/task_button.dart';
import 'package:enfluwence/pages/influencers/screens/home/home_header.dart';
import 'package:enfluwence/pages/influencers/screens/home/totals.dart';
import 'package:enfluwence/pages/influencers/screens/wallet/fund_account_botton.dart';
import 'package:enfluwence/pages/transactions/screens/transactions_list.dart';
import 'package:enfluwence/utills/consts/size.dart';
import 'package:enfluwence/widgets/containers/card.dart';
import 'package:enfluwence/widgets/containers/page_container.dart';
import 'package:enfluwence/widgets/header/section_header.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List recentCampaign = Tasks.getCampaign();
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
            TransactionsList(
              heading: "Recent Spending",
            ),
          ]),
        ),
        const Totals(),
        const SectionHeader(
          title: "Campaign Tasks",
          textButton: "View all",
        ),
        CampaignList(
          list: recentCampaign,
          title: "Recent Campaigns,",
        ),
      ],
    );
  }
}
