import 'dart:core';

import 'package:enfluwence/data/repositories/authentication/authentication_repository.dart';
import 'package:enfluwence/http/auth/auth.dart';
import 'package:enfluwence/pages/auth/models/verify.dart';
import 'package:enfluwence/pages/general/models/user.dart';
import 'package:enfluwence/utills/consts/asset_paths.dart';
import 'package:enfluwence/utills/consts/text.dart';
import 'package:enfluwence/utills/helpers/network_manager.dart';
import 'package:enfluwence/utills/local_storage/storage_utility.dart';
import 'package:enfluwence/utills/popups/full_screen_loader.dart';
import 'package:enfluwence/utills/popups/snack_bar_pop.dart';
import 'package:enfluwence/widgets/pages/success_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyController extends GetxController {
  static VerifyController get instance => Get.find();

  // form varibles
  final otp = TextEditingController();
  GlobalKey<FormState> verifyFromKey = GlobalKey<FormState>();

  Future<void> resendotp() async {
    try {
      AFullScreenLoader.openLoadingDialog(
          AText.processInfo, AAssets.docerAnimation);
      // check inetrnet connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) return;
      if (storage.readData("currentUser") == null) {
        // show error message
        Get.snackbar('Oh Snap!', "Error validating you.");
        return;
      }
      final currentUser = User.fromJson(storage.readData("currentUser"));
      var response = await AuthApi.resendotp(currentUser.email);
      AFullScreenLoader.stopLoading();
      ASnackBar().successSackBar(title: "Sent!", message: response['message']);
    } catch (e) {
      AFullScreenLoader.stopLoading();
      ASnackBar().dangerSackBar(title: "Oh Snap!", message: e.toString());
    }
  }

  Future<void> verifyEmail() async {
    try {
      // start loading
      AFullScreenLoader.openLoadingDialog(
          AText.processInfo, AAssets.docerAnimation);
      // check inetrnet connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) return;
      // from validation
      if (!verifyFromKey.currentState!.validate()) return;
      var storage = ALocalStorage();

      if (storage.readData("currentUser") == null) {
        // show error message
        ASnackBar()
            .dangerSackBar(title: "Oh Snap!", message: "Error validating you");
        return;
      }
      final currentUser = User.fromJson(storage.readData("currentUser"));
      // Verify user through API
      VerifyEmail data =
          VerifyEmail(email: currentUser.email, code: otp.text.trim());
      var response = await AuthApi.verifyEmail(data);
      var user = response['data']['user'];
      // save auth user data in localStorage
      await storage.saveData("currentUser", user);
      await storage.saveData("token", response['data']['token']);
      // show success message
      ASnackBar().successSackBar(title: "Great!", message: response['message']);
      // stop loading
      AFullScreenLoader.stopLoading();
      // redirect
      // AuthenticationRepository.instance.screenRedirect();
      ASnackBar().successSackBar(
          title: "Great!", message: "Task Created Successfully");
      Get.to(() => SuccessSCreen(
          text: "Your Account Verified Successfully.",
          animation: AAssets.successAnimation));
    } catch (e) {
      // handle error
      AFullScreenLoader.stopLoading();
      ASnackBar().dangerSackBar(title: "Oh Snap!", message: e.toString());
      print(e.toString());
    }
  }
}
