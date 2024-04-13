import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SimpleTabController extends GetxController {
  static SimpleTabController get instance => Get.find();

  // var
  final tabController = TabController;
  final int pageCount = 4;
  Rx<int> currentPageIndex = 0.obs;

  // update current index when page scroll
  void onPageChanged(int index) {
    currentPageIndex.value = index;
  }

  // update current index and jump to next page

  /// Update current index and jump to last page
}
