import 'dart:convert';
import 'package:enfluwence/data/repositories/authentication/authentication_repository.dart';
import 'package:enfluwence/http/wallet/user.dart';
import 'package:enfluwence/pages/general/models/user.dart';
import 'package:enfluwence/pages/general/screens/profile/update_profile.dart';
import 'package:enfluwence/utills/consts/asset_paths.dart';
import 'package:enfluwence/utills/consts/text.dart';
import 'package:enfluwence/utills/helpers/network_manager.dart';
import 'package:enfluwence/utills/popups/full_screen_loader.dart';
import 'package:enfluwence/utills/popups/snack_bar_pop.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class GeneralUserController extends GetxController {
  static GeneralUserController get instance => Get.find();
  static dynamic currentUser = storage.readData("currentUser");
  final isLoading = true.obs;
  final user = User.user.obs;
  final userUpdate = UserUpdate.empty().obs;
  static dynamic token = storage.readData("token");
  Rx<double> balance = 0.0.obs;

  // form keys
  GlobalKey<FormState> updateProfile = GlobalKey<FormState>();

  // from controllers
  var name = TextEditingController();
  var phoneNumber = TextEditingController();
  var address = TextEditingController();
  var state = TextEditingController();
  var country = TextEditingController();
  var facebook = TextEditingController();
  var whatsapp = TextEditingController();
  var twitter = TextEditingController();
  var instagram = TextEditingController();

  // controllers

  @override
  void onInit() {
    super.onInit();
    getUserBalance();
    get_user();
    isLoading.value = false;
  }

  static bool isInfluencer() {
    return currentUser['isInfluencer'];
  }

  Future<bool> get_user() async {
    try {
      var data = await UserApi().get_user();
      storage.saveData("currentUser", data);
      user.value = User.user;
      if (user.value.name != null) {
        updateTextEditingValue();
      }
      return true;
    } catch (e) {
      ASnackBar().dangerSackBar(title: "Oh Snap!", message: e.toString());
    }
    return false;
  }

  updateTextEditingValue() {
    name.text = user.value.name!;
    phoneNumber.text = user.value.phoneNumber!;
    facebook.text = user.value.facebook!;
    instagram.text = user.value.instagram!;
    twitter.text = user.value.twitter!;
    whatsapp.text = user.value.whatsapp!;
  }

  Future<void> getUserBalance() async {
    try {
      var data = await UserApi().get_balance();
      this.balance(double.parse(data.toString()));
    } catch (e) {}
  }

  update_profile({bool isFirstUpdate = false}) async {
    try {
      // start loading
      AFullScreenLoader.openLoadingDialog(
          AText.processInfo, AAssets.docerAnimation);
      // check inetrnet connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) throw "";
      // from validation
      if (!updateProfile.currentState!.validate()) throw "";
      userUpdate.value.name = name.text;
      userUpdate.value.phoneNumber = phoneNumber.text;
      userUpdate.value.facebook = facebook.text;
      userUpdate.value.instagram = instagram.text;
      userUpdate.value.twitter = twitter.text;
      userUpdate.value.whatsapp = whatsapp.text;
      var response = await UserApi.updateUser(userUpdate.value);
      storage.saveData("currentUser", response['data']['user']);
      user.value = User.user;
      AFullScreenLoader.stopLoading();
      ASnackBar().successSackBar(title: "Great!", message: response['message']);
      print(isFirstUpdate);
      if (isFirstUpdate) {
        AuthenticationRepository().screenRedirect();
      }
    } catch (e) {
      AFullScreenLoader.stopLoading();
      ASnackBar().dangerSackBar(title: "OOps!", message: e.toString());
    }
  }

  // static balance() async =>
}
