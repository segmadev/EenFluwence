import 'package:enfluwence/pages/auth/controllers/influencer/influencer_controller.dart';
import 'package:enfluwence/pages/influencers/models/tasks_list.dart';
import 'package:enfluwence/pages/influencers/screens/tasks/campaign/all_campaigns_list.dart';
import 'package:enfluwence/pages/influencers/screens/tasks/campaign/campaign_list.dart';
import 'package:enfluwence/widgets/containers/page_container.dart';
import 'package:enfluwence/widgets/navigation/back_navigation.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AllCampaings extends StatelessWidget {
  const AllCampaings({super.key});

  @override
  Widget build(BuildContext context) {
    return const BackNavigation(
      body: PageContainer(
        children: [
          AllCampaignsList(),
        ],
      ),
    );
  }
}
