import 'package:enfluwence/pages/auth/controllers/influencer/influencer_controller.dart';
import 'package:enfluwence/pages/influencers/screens/tasks/campaign/campaign_list.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AllCampaignsList extends StatelessWidget {
  const AllCampaignsList({super.key});

  @override
  Widget build(BuildContext context) {
    InfluencerController controller = Get.find();
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height - 100,
      child: SingleChildScrollView(
        controller: controller.capaignScrollController,
        child: Obx(() => CampaignList(
              list: controller.taskLists.value,
            )),
      ),
    );
  }
}
