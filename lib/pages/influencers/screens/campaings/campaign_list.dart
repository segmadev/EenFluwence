import 'package:enfluwence/pages/influencers/screens/campaings/single_campaign.dart';
import 'package:flutter/material.dart';

class CampaignList extends StatelessWidget {
  const CampaignList({super.key, required this.list, this.title});
  final List list;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title ?? "", style: Theme.of(context).textTheme.bodySmall),
        Column(
          children: list.map((campaign) {
            return SingleCampaign(campaign: campaign);
          }).toList(),
        ),
      ],
    );
  }
}
