import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PreviewController extends GetxController {
  static PreviewController get instance => Get.find();

  // var
  final pageController = PageController();
  final int pageCount = 4;
  Rx<int> currentPageIndex = 0.obs;

  // update current index when page scroll
  void onPageChanged(int index) {
    currentPageIndex.value = index;
  }

  // update current index and jump to next page
  void nextPage() {
    // check if not last page before jump
    if (currentPageIndex.value < pageCount) {
      currentPageIndex.value++;
      pageController.animateToPage(
        currentPageIndex.value,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      // Get.to(LoginScreen());
    }
  }

  /// Update current index and jump to last page
  void skipToLastPage() {
    currentPageIndex.value = pageCount;
    pageController.jumpToPage(pageCount);
  }
}
