import 'package:enfluwence/pages/general/general_user.dart';
import 'package:enfluwence/pages/influencers/models/user.dart';
import 'package:enfluwence/pages/influencers/screens/profile/profile.dart';
import 'package:enfluwence/utills/consts/colors.dart';
import 'package:enfluwence/utills/consts/icons.dart';
import 'package:enfluwence/utills/consts/size.dart';
import 'package:enfluwence/widgets/appbar/appbar.dart';
import 'package:enfluwence/widgets/navigation/navigation_controller.dart';
import 'package:enfluwence/widgets/navigation/navigation_list.dart';
import 'package:enfluwence/widgets/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final generalUserController = Get.put(GeneralUserController());
    final controller = Get.put(NavigationController());
    final navigationList = ANavigationList.navigationList;
    return Scaffold(
      appBar: AAppBar(
        showBackArrow: false,
        leadingWidth: 40,
        leading: InkWell(
            onTap: () {
              Get.to(ProfilePage());
            },
            child: AProfile.profileAvatar),
        title: InkWell(
          onTap: () {
            Get.to(ProfilePage());
          },
          child: Text(User.user.username ?? "Undfined",
              style: TextStyle(color: AColor.appBarText)),
        ),
        actions: [
          IconButton(
            iconSize: ASizes.iconMd,
            icon: Icon(AIcons.notification),
            onPressed: () {},
          ),
          IconButton(
            iconSize: ASizes.iconMd,
            icon: Icon(AIcons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: ASizes.navBarHeight,
          elevation: ASizes.navBarElevation,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) =>
              controller.selectedIndex.value = index,
          destinations: navigationList.map((nav) {
            return NavigationDestination(
              icon: Icon(nav['icon']),
              label: nav['label'],
            );
          }).toList(),
        ),
      ),
      body: Obx(
        () => navigationList.isNotEmpty
            ? navigationList[controller.selectedIndex.value]['screen']
            : const Center(child: Text("Error Geting Page")),
      ),
    );
  }
}
