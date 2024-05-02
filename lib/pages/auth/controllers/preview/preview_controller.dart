import 'package:enfluwence/pages/auth/screens/auth.dart';
import 'package:enfluwence/pages/auth/screens/preview/preview_list.dart';
import 'package:enfluwence/utills/local_storage/storage_utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PreviewController extends GetxController {
  static PreviewController get instance => Get.find();

  // var
  final pageController = PageController();
  final List<dynamic> previewList = APreviewList.previewList;
  var pageCount = APreviewList.previewList.length - 1;
  Rx<int> currentPageIndex = 0.obs;

  // update current index when page scroll
  void onPageChanged(int index) {
    currentPageIndex.value = index;
  }

  void setPageCount(int count) {
    pageCount = count;
  }

  // update current index and jump to next page

  void nextPage(context) {
    // check if not last page before jump
    if (currentPageIndex.value >= pageCount) {
      ALocalStorage().saveData("IsFirstTime", false);
      Get.to(const AuthScreen());
    } else {
      currentPageIndex.value++;
      pageController.animateToPage(
        currentPageIndex.value,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  /// Update current index and jump to last page
  void skipToLastPage() {
    Get.to(const AuthScreen());
  }
}
