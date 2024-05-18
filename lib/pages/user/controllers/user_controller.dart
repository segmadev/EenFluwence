import 'dart:convert';

import 'package:enfluwence/data/repositories/authentication/authentication_repository.dart';
import 'package:enfluwence/http/influencer/influencer_api.dart';
import 'package:enfluwence/pages/influencers/models/tasks.dart';
import 'package:enfluwence/pages/transactions/models/transactions.dart';
import 'package:enfluwence/utills/helpers/network_manager.dart';
import 'package:enfluwence/utills/local_storage/storage_utility.dart';
import 'package:enfluwence/utills/popups/snack_bar_pop.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();
  // final influencerApi = Get.put(InfluencerApi());
  // final taskList = Get.put(TasksList);
  ALocalStorage storage = Get.find();
  final taskCompleted = 0.0.obs;
  final totalEarnings = 0.obs;
  final earnings = 0.obs;
  final expenditure = 0.obs;
  final isLoadingRecent = true.obs;
  final spending = <Transaction>[].obs;
  final taskLists = <TasksList>[].obs;
  final listNextPage = 1.obs;
  final hasNext = true.obs;

  @override
  void onInit() {
    super.onInit();
    iniAllDtata();
  }

  iniAllDtata() {
    if (storage.readData("token") == null ||
        storage.readData("currentUser") == null) {
      AuthenticationRepository().screenRedirect();
    }
    try {} catch (e) {
      ASnackBar().dangerSackBar(
          title: "Oh Snap!", message: "We are unable to fetch data.");
    }
  }
}
