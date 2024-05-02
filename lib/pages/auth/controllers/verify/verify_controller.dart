import 'dart:core';

import 'package:enfluwence/data/repositories/authentication/authentication_repository.dart';
import 'package:enfluwence/http/auth/auth.dart';
import 'package:enfluwence/pages/auth/models/verify.dart';
import 'package:enfluwence/pages/influencers/models/user.dart';
import 'package:enfluwence/utills/consts/asset_paths.dart';
import 'package:enfluwence/utills/consts/text.dart';
import 'package:enfluwence/utills/helpers/network_manager.dart';
import 'package:enfluwence/utills/local_storage/storage_utility.dart';
import 'package:enfluwence/utills/popups/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyController extends GetxController {
  static VerifyController get instance => Get.find();

  // form varibles
  final otp = TextEditingController();
  GlobalKey<FormState> verifyFromKey = GlobalKey<FormState>();

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
        Get.snackbar('Oh Snap!', "Error validating you.");
        return;
      }
      final currentUser = Influencer.fromJson(storage.readData("currentUser"));
      // Verify user through API
      VerifyEmail data =
          VerifyEmail(email: currentUser.email, code: otp.text.trim());
      var response = await AuthApi.verifyEmail(data);
      var user = response['data']['user'];
      // save auth user data in localStorage
      await storage.saveData("currentUser", user);
      await storage.saveData("token", response['data']['token']);
      // show success message
      Get.snackbar('Great!', response['message']);
      // stop loading
      AFullScreenLoader.stopLoading();
      // redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      // handle error
      Get.snackbar('Oh Snap!', e.toString());
      print(e.toString());
    } finally {
      // remove loader
      AFullScreenLoader.stopLoading();
    }
  }
}
