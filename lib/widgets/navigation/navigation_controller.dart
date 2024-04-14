import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    Container(
      child: const Center(child: Text("Home")),
    ),
    Container(
      child: const Center(child: Text("Campaigns")),
    ),
    Container(
      child: const Center(child: Text("Wallet")),
    ),
    Container(
      child: const Center(child: Text("More")),
    ),
  ];
}
