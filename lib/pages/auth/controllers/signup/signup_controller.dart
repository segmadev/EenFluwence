import 'dart:convert';
import 'dart:core';

import 'package:enfluwence/http/auth/auth.dart';
import 'package:enfluwence/pages/auth/models/signup.dart';
import 'package:enfluwence/pages/auth/screens/OTP/otp.dart';
import 'package:enfluwence/pages/influencers/models/user.dart';
import 'package:enfluwence/utills/consts/asset_paths.dart';
import 'package:enfluwence/utills/consts/text.dart';
import 'package:enfluwence/utills/helpers/network_manager.dart';
import 'package:enfluwence/utills/local_storage/storage_utility.dart';
import 'package:enfluwence/utills/popups/full_screen_loader.dart';
import 'package:enfluwence/utills/popups/snack_bar_pop.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  // form varibles
  final hidePassword = true.obs;
  final email = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> signupFromKey = GlobalKey<FormState>();

  Future<void> signup() async {
    try {
      // start loading
      AFullScreenLoader.openLoadingDialog(
          AText.processInfo, AAssets.docerAnimation);
      // check inetrnet connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) return;
      // from validation
      if (!signupFromKey.currentState!.validate()) return;
      // privacy policy checkbox

      // Register user through API
      SignUp data = SignUp(
          email: email.text.trim(),
          username: username.text.trim(),
          password: password.text.trim());
      // var data  = SignUp(email: email.text.trim(), username:  username.text.trim(), password: password.text.trim());
      var response = await AuthApi.signUp(data);
      var user = Influencer.fromJson(response['data']['user']);
      // save auth user data in localStorage
      var storage = ALocalStorage();
      await storage.saveData("currentUser", user);
      // show success message
      ASnackBar().successSackBar(title: "Great!", message: response['message']);
      // naviagte to verify page
      // AFullScreenLoader.stopLoading();
      Get.to(() => const OTPScreen());
    } catch (e) {
      // handle error
      ASnackBar().dangerSackBar(title: "Oh Snap!", message: e.toString());
      print(e.toString());
    } finally {
      // remove loader
      AFullScreenLoader.stopLoading();
    }
  }
}
