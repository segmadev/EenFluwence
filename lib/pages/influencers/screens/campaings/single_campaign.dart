import 'package:enfluwence/pages/influencers/models/tasks.dart';
import 'package:enfluwence/utills/consts/colors.dart';
import 'package:enfluwence/utills/consts/size.dart';
import 'package:enfluwence/utills/consts/text.dart';
import 'package:enfluwence/utills/helpers/helper_functions.dart';
import 'package:enfluwence/widgets/containers/badge.dart';
import 'package:enfluwence/widgets/containers/card.dart';
import 'package:flutter/material.dart';

class SingleCampaign extends StatelessWidget {
  const SingleCampaign({super.key, this.campaign});
  final dynamic campaign;
  @override
  Widget build(BuildContext context) {
    final String name = Tasks.getTaskName(campaign['type_id']);
    final bool isComplete = campaign['is_completed'];
    return ACard(
      width: double.infinity,
      padding: ASizes.sm,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 10,
                height: 60,
                decoration: BoxDecoration(
                    gradient: AColor.gradinetColor,
                    borderRadius: BorderRadius.circular(10)),
              ),
              SizedBox(
                width: ASizes.sm,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: Theme.of(context).textTheme.titleMedium),
                  Text(
                    AHelperFunctions.fomartDate(campaign['created_at']),
                    style: Theme.of(context).textTheme.bodySmall,
                  )
                ],
              )
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
