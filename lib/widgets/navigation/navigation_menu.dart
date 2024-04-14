import 'package:enfluwence/utills/consts/icons.dart';
import 'package:enfluwence/utills/consts/size.dart';
import 'package:enfluwence/widgets/navigation/navigation_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: ASizes.navBarHeight,
          elevation: ASizes.navBarElevation,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) =>
              controller.selectedIndex.value = index,
          destinations: const [
            NavigationDestination(
              icon: Icon(AIcons.home),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(AIcons.campaigns),
              label: 'Campaigns',
            ),
            NavigationDestination(
              icon: Icon(AIcons.wallet),
              label: 'Wallet',
            ),
            NavigationDestination(
              icon: Icon(AIcons.widget),
              label: 'More',
            ),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}
