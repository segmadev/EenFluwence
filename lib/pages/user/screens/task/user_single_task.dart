import 'package:enfluwence/pages/influencers/models/tasks.dart';
import 'package:enfluwence/pages/user/screens/task/perfrom_task.dart';
import 'package:enfluwence/utills/consts/colors.dart';
import 'package:enfluwence/utills/consts/size.dart';
import 'package:enfluwence/utills/helpers/helper_functions.dart';
import 'package:enfluwence/widgets/containers/badge.dart';
import 'package:enfluwence/widgets/containers/card.dart';
import 'package:enfluwence/widgets/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class USingleTask extends StatelessWidget {
  const USingleTask({super.key, required this.task});
  final TasksList task;
  @override
  Widget build(BuildContext context) {
    final noOfTaskRemain = task.totalNumberOfEngagements - task.engagements;
    final influencer = task.influencer;
    final taskType = task.type;
    return ACard(
      onTap: () {
        Get.to(PerformTask(
          id: task.id,
        ));
      },
      border: Border.all(width: 1.0, color: AColor.boderColor.withOpacity(0.2)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  AProfile.display_profile(avatar: influencer.avatar),
                  const SizedBox(width: ASizes.sm),
                  SizedBox(
                    width: 150,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          taskType.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        Text(
                          "posted by ${influencer.username}",
                          maxLines: 1,
                          overflow: TextOverflow.fade,
                          softWrap: true,
                          style: Theme.of(context).textTheme.bodySmall,
                        )
                      ],
                    ),
                  )
                ],
              ),
              ABadge(
                width: 100,
                label: AHelperFunctions.moneyFormart(task.costPerEngagement,
                    withColor: false),
                color: AColor.darkSuccess,
              ),
            ],
          ),
          const SizedBox(
            height: ASizes.sm,
          ),
          Text(
            "Lorem ipsum dolor sit amet, consectetur adip occurence velit in auctor dapibus auctor dapibus Lorem ipsum dolor sit amet. ",
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(
            height: ASizes.sm,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(AHelperFunctions.fomartDate(task.createdAt)),
              ABadge(
                width: 160,
                label: "$noOfTaskRemain Tasks Remaining",
                color:
                    noOfTaskRemain <= 5 ? AColor.danger : AColor.lightSuccess,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
