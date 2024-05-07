import 'dart:core';
import 'package:enfluwence/data/repositories/authentication/authentication_repository.dart';
import 'package:enfluwence/http/auth/auth.dart';
import 'package:enfluwence/pages/auth/models/siginin.dart';
import 'package:enfluwence/utills/consts/asset_paths.dart';
import 'package:enfluwence/utills/consts/text.dart';
import 'package:enfluwence/utills/helpers/network_manager.dart';
import 'package:enfluwence/utills/local_storage/storage_utility.dart';
import 'package:enfluwence/utills/popups/full_screen_loader.dart';
import 'package:enfluwence/utills/popups/snack_bar_pop.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  static SignInController get instance => Get.find();

  // form varibles
  final hidePassword = true.obs;
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> signInFromKey = GlobalKey<FormState>();

  Future<void> signIn() async {
    try {
      // start loading
      AFullScreenLoader.openLoadingDialog(
          AText.processInfo, AAssets.docerAnimation);
      // check inetrnet connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) throw "";
      ;
      // from validation
      if (!signInFromKey.currentState!.validate())
        throw "Fill all required fields";

      // Login user through API
      SignIn data =
          SignIn(email: email.text.trim(), password: password.text.trim());
      var response = await AuthApi.signIn(data);
      var user = response['data']['user'];
      print(user);
      // save auth user data in localStorage
      var storage = ALocalStorage();
      await storage.removeData("currentUser");
      await storage.removeData("token");
      await storage.saveData("currentUser", user);
      await storage.saveData("token", response['data']['token']);
      // show success message
      ASnackBar().successSackBar(title: "Great!", message: response['message']);
      // stop loading
      AFullScreenLoader.stopLoading();
      // redirect
      await AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      // handle error
      AFullScreenLoader.stopLoading();
      ASnackBar().dangerSackBar(title: "Oh Snap!", message: e.toString());
      // print(e.toString());
    }
  }
}
