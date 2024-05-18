import 'package:enfluwence/utills/consts/colors.dart';
import 'package:enfluwence/utills/consts/size.dart';
import 'package:enfluwence/widgets/containers/badge.dart';
import 'package:enfluwence/widgets/containers/card.dart';
import 'package:enfluwence/widgets/profile/profile.dart';
import 'package:flutter/material.dart';

class USingleTask extends StatelessWidget {
  const USingleTask({super.key});

  @override
  Widget build(BuildContext context) {
    return ACard(
      onTap: () {},
      border: Border.all(width: 1.0, color: AColor.boderColor.withOpacity(0.2)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  AProfile.profileAvatar,
                  const SizedBox(width: ASizes.sm),
                  Text(
                    "Task and Survey",
                    style: Theme.of(context).textTheme.titleMedium,
                  )
                ],
              ),
              const ABadge(
                width: 100,
                label: "NGN 150",
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
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Today, 16:36"),
              ABadge(
                width: 160,
                label: "3 Tasks Remaining",
                color: AColor.danger,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
