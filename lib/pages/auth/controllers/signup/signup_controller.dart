import 'dart:convert';
import 'dart:core';

import 'package:enfluwence/http/auth/auth.dart';
import 'package:enfluwence/pages/auth/models/signup.dart';
import 'package:enfluwence/pages/auth/screens/OTP/otp.dart';
import 'package:enfluwence/pages/general/models/user.dart';
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
  final signAsUser = true.obs;
  GlobalKey<FormState> signupFromKey = GlobalKey<FormState>();

  changeSignUpAsValue(isUser) {
    signAsUser.value = isUser ? true : false;
  }

  Future<void> signup() async {
    try {
      // start loading
      AFullScreenLoader.openLoadingDialog(
          AText.processInfo, AAssets.docerAnimation);
      // check inetrnet connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) throw "";
      // from validation
      if (!signupFromKey.currentState!.validate())
        throw "Fill all required fields";
      // privacy policy checkbox

      // Register user through API
      SignUp data = SignUp(
          email: email.text.trim().toLowerCase(),
          username: username.text.trim().toLowerCase(),
          password: password.text.trim());
      // var data  = SignUp(email: email.text.trim(), username:  username.text.trim(), password: password.text.trim());
      var response = await AuthApi.signUp(data, isUser: signAsUser.value);
      // var user = User.fromJson(response['data']['user']);
      // save auth user data in localStorage
      var storage = ALocalStorage();
      await storage.saveData("currentUser", response['data']['user']);
      // show success message
      ASnackBar().successSackBar(
          position: "top", title: "Great!", message: response['message']);
      // naviagte to verify page
      // AFullScreenLoader.stopLoading();
      Get.to(() => const OTPScreen());
    } catch (e) {
      // handle error
      AFullScreenLoader.stopLoading();
      ASnackBar().dangerSackBar(
          position: "top", title: "Oh Snap!", message: e.toString());
    }
  }
}
