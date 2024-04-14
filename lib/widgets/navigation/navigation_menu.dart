import 'package:enfluwence/utills/consts/icons.dart';
import 'package:enfluwence/utills/consts/size.dart';
import 'package:enfluwence/widgets/navigation/navigation_controller.dart';
import 'package:enfluwence/widgets/navigation/navigation_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final navigationList = Get.put(ANavigationList.navigationList);
    return Scaffold(
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
      body: Obx(() => navigationList[controller.selectedIndex.value]['screen']),
    );
  }
}
