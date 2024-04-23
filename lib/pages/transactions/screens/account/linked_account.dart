import 'package:enfluwence/utills/consts/colors.dart';
import 'package:enfluwence/utills/consts/icons.dart';
import 'package:enfluwence/utills/consts/size.dart';
import 'package:enfluwence/widgets/containers/card.dart';
import 'package:enfluwence/widgets/containers/page_container.dart';
import 'package:enfluwence/widgets/navigation/back_navigation.dart';
import 'package:enfluwence/widgets/text/TitleP.dart';
import 'package:flutter/material.dart';
import 'package:u_credit_card/u_credit_card.dart';

class LinkedAccount extends StatelessWidget {
  const LinkedAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return BackNavigation(
      body: PageContainer(
        children: [
          ACard(
            child: Column(
              children: [
                Text(
                  "Linked Accounts",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                SizedBox(height: ASizes.defaultSpace),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(
                                "https://www.ubagroup.com/wp-content/uploads/2018/09/UBA-logo.gif"),
                          ),
                          SizedBox(width: ASizes.defaultSpace),
                          TitleP(
                            title: "Master Card UBA",
                            paragraph: "2387****785",
                          ),
                        ],
                      ),
                      Icon(
                        AIcons.delete,
                        color: AColor.danger,
                      )
                    ])
              ],
            ),
          ),
        ],
      ),
    );
  }
}
