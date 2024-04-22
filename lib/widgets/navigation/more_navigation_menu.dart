import 'package:enfluwence/utills/consts/icons.dart';
import 'package:enfluwence/utills/consts/size.dart';
import 'package:enfluwence/widgets/containers/card.dart';
import 'package:enfluwence/widgets/containers/page_container.dart';
import 'package:enfluwence/widgets/navigation/navigation_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MoreNavigationMenu extends StatelessWidget {
  const MoreNavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final List<dynamic> menuList = ANavigationList.moreNavigationList;
    return PageContainer(
      children: menuList.map((menu) {
        return ACard(
            padding: ASizes.lg,
            backgroundColor: menu['color'] ?? null,
            onTap: () {
              Get.to(menu['screen']);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(menu['label']),
                Icon(
                  menu['icon'] ?? AIcons.forward,
                  size: ASizes.iconSm,
                )
              ],
            ));
      }).toList(),
    );
  }
}
