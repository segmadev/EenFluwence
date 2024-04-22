import 'package:enfluwence/pages/influencers/screens/tasks/campaign/single_campaign.dart';
import 'package:enfluwence/utills/consts/size.dart';
import 'package:enfluwence/widgets/appbar/appbar.dart';
import 'package:enfluwence/widgets/charts/line_chat.dart';
import 'package:enfluwence/widgets/containers/card.dart';
import 'package:enfluwence/widgets/containers/page_container.dart';
import 'package:enfluwence/widgets/navigation/back_navigation.dart';
import 'package:flutter/material.dart';

class CampaignDetails extends StatelessWidget {
  const CampaignDetails({super.key, required this.campaign});
  final dynamic campaign;
  @override
  Widget build(BuildContext context) {
    return BackNavigation(
        body: PageContainer(
      children: [
        SizedBox(
          height: ASizes.sm,
        ),
        SingleCampaign(
          campaign: campaign,
          showIcon: true,
        ),
        LineChart(),
      ],
    ));
  }
}
