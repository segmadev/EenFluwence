import 'package:enfluwence/utills/consts/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ASnackBar extends GetxController {
  final opacity = 0.2;
  defaultSackBar({required title, message = '', duration = 5}) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: duration),
      margin: const EdgeInsets.all(10),
      icon: Icon(
        Icons.info,
      ),
    );
  }

  successSackBar({required title, message = '', duration = 5}) {
    Get.snackbar(
      title,
      message,
      barBlur: 0.7,
      isDismissible: true,
      shouldIconPulse: true,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: duration),
      colorText: AColor.darkSuccess,
      backgroundColor: AColor.darkSuccess.withOpacity(0.3),
      margin: const EdgeInsets.all(20),
      icon: Icon(
        Icons.check,
        color: AColor.darkSuccess,
      ),
    );
  }

  warningSackBar({required title, message = '', duration = 5}) {
    Get.snackbar(
      title,
      message,
      barBlur: 0.7,
      isDismissible: true,
      shouldIconPulse: true,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: duration),
      colorText: AColor.warning,
      backgroundColor: AColor.warning.withOpacity(opacity),
      margin: const EdgeInsets.all(10),
      icon: Icon(
        Icons.warning,
        color: AColor.warning,
      ),
    );
  }

  dangerSackBar({required title, message = '', duration = 5}) {
    Get.snackbar(
      title,
      message,
      barBlur: 0.7,
      isDismissible: true,
      shouldIconPulse: true,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: duration),
      colorText: AColor.danger,
      backgroundColor: AColor.danger.withOpacity(opacity),
      margin: const EdgeInsets.all(20),
      icon: Icon(
        Icons.warning,
        color: AColor.danger,
      ),
    );
  }
}
