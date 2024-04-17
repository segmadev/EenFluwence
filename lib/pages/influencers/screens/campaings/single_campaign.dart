import 'package:enfluwence/pages/influencers/models/tasks.dart';
import 'package:enfluwence/pages/influencers/screens/campaings/campaign_details.dart';
import 'package:enfluwence/utills/consts/colors.dart';
import 'package:enfluwence/utills/consts/size.dart';
import 'package:enfluwence/utills/consts/text.dart';
import 'package:enfluwence/utills/helpers/helper_functions.dart';
import 'package:enfluwence/widgets/containers/CircleIcon.dart';
import 'package:enfluwence/widgets/containers/badge.dart';
import 'package:enfluwence/widgets/containers/card.dart';
import 'package:enfluwence/widgets/text/TitleP.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SingleCampaign extends StatelessWidget {
  const SingleCampaign({super.key, this.campaign, this.showIcon = true});
  final dynamic campaign;
  final bool showIcon;
  @override
  Widget build(BuildContext context) {
    final String name = Tasks.getTaskName(campaign['type_id']);
    final bool isComplete = campaign['is_completed'];
    return ACard(
      onTap: () {
        Get.to(CampaignDetails(
          campaign: campaign,
        ));
      },
      width: double.infinity,
      padding: ASizes.sm,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              showIcon
                  ? const CircleIcon(
                      icon: Icons.wb_sunny_outlined, color: AColor.lightSuccess)
                  : Container(
                      width: 10,
                      height: 60,
                      decoration: BoxDecoration(
                          gradient: AColor.gradinetColor,
                          borderRadius: BorderRadius.circular(10)),
                    ),
              const SizedBox(
                width: ASizes.sm,
              ),
              TitleP(
                  title: name,
                  paragraph:
                      AHelperFunctions.fomartDate(campaign['created_at']))
            ],
          ),
          ABadge(
              label: isComplete ? AText.completed : AText.inComplete,
              color: isComplete ? AColor.lightSuccess : AColor.warning),
        ],
      ),
    );
  }
}
