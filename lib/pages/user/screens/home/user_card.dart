import 'package:enfluwence/pages/general/models/user.dart';
import 'package:enfluwence/utills/consts/colors.dart';
import 'package:enfluwence/utills/consts/size.dart';
import 'package:enfluwence/utills/consts/text.dart';
import 'package:enfluwence/widgets/containers/card.dart';
import 'package:enfluwence/widgets/profile/profile.dart';
import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  const UserCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ACard(
          height: 280,
          padding: 30,
          border: Border.all(width: 2.0, color: AColor.boderColor),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  AProfile.profileAvatar,
                  SizedBox(height: ASizes.defaultSpace),
                  Text(
                    User.user.name!,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  Text(User.user.email!,
                      style: Theme.of(context).textTheme.bodySmall)
                ],
              ),
              SizedBox(
                width: 360,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(AText.completedTask,
                            style: Theme.of(context).textTheme.labelSmall),
                        Text("0",
                            style: Theme.of(context).textTheme.headlineMedium)
                      ],
                    ),
                    Column(
                      children: [
                        Text(AText.totalEranings,
                            style: Theme.of(context).textTheme.labelSmall),
                        Text("N0",
                            style: Theme.of(context).textTheme.headlineMedium)
                      ],
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}
