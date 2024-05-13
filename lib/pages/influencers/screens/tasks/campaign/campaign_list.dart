import 'package:enfluwence/pages/influencers/screens/tasks/campaign/single_campaign.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CampaignList extends StatelessWidget {
  const CampaignList(
      {super.key, required this.list, this.title, this.limit = 0});
  final List list;
  final String? title;
  final int limit;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title ?? "", style: Theme.of(context).textTheme.bodySmall),
        Column(
          children: list.take(limit > 0 ? limit : list.length).map((campaign) {
            return SingleCampaign(
              campaign: campaign,
              showIcon: false,
            );
          }).toList(),
        ),
      ],
    );
  }
}
