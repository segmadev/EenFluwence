import 'package:enfluwence/utills/consts/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ASnackBar extends GetxController {
  final opacity = 0.3;
  defaultSackBar(
      {required title, message = '', duration = 5, position = "bottom"}) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      snackPosition:
          position == "bottom" ? SnackPosition.BOTTOM : SnackPosition.TOP,
      duration: Duration(seconds: duration),
      margin: const EdgeInsets.all(10),
      icon: Icon(
        Icons.info,
      ),
    );
  }

  successSackBar(
      {required title, message = '', duration = 5, position = "bottom"}) {
    Get.snackbar(
      title,
      message,
      barBlur: 0.7,
      isDismissible: true,
      shouldIconPulse: true,
      snackPosition:
          position == "bottom" ? SnackPosition.BOTTOM : SnackPosition.TOP,
      duration: Duration(seconds: duration),
      colorText: AColor.white,
      backgroundColor: AColor.darkSuccess,
      margin: const EdgeInsets.all(20),
      icon: Icon(
        Icons.check,
        color: AColor.white,
      ),
    );
  }

  warningSackBar(
      {required title, message = '', duration = 5, position = "bottom"}) {
    Get.snackbar(
      title,
      message,
      barBlur: 0.7,
      isDismissible: true,
      shouldIconPulse: true,
      snackPosition:
          position == "bottom" ? SnackPosition.BOTTOM : SnackPosition.TOP,
      duration: Duration(seconds: duration),
      colorText: AColor.white,
      backgroundColor: AColor.warning,
      margin: const EdgeInsets.all(10),
      icon: Icon(
        Icons.warning,
        color: AColor.white,
      ),
    );
  }

  dangerSackBar(
      {required title, message = '', duration = 5, position = "bottom"}) {
    Get.snackbar(
      title,
      message,
      barBlur: 0.7,
      isDismissible: true,
      shouldIconPulse: true,
      snackPosition:
          position == "bottom" ? SnackPosition.BOTTOM : SnackPosition.TOP,
      duration: Duration(seconds: duration),
      colorText: AColor.white,
      backgroundColor: AColor.danger.withOpacity(opacity),
      margin: const EdgeInsets.all(20),
      icon: Icon(
        Icons.warning,
        color: AColor.white,
      ),
    );
  }
}
