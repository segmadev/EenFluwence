import 'dart:convert';

import 'package:enfluwence/data/repositories/authentication/authentication_repository.dart';
import 'package:enfluwence/http/influencer/influencer_api.dart';
import 'package:enfluwence/pages/influencers/models/tasks.dart';
import 'package:enfluwence/pages/influencers/models/user.dart';
import 'package:enfluwence/pages/influencers/screens/tasks/campaign/campaign_page.dart';
import 'package:enfluwence/pages/transactions/models/transactions.dart';
import 'package:enfluwence/utills/consts/asset_paths.dart';
import 'package:enfluwence/utills/consts/text.dart';
import 'package:enfluwence/utills/helpers/network_manager.dart';
import 'package:enfluwence/utills/local_storage/storage_utility.dart';
import 'package:enfluwence/utills/popups/full_screen_loader.dart';
import 'package:enfluwence/utills/popups/snack_bar_pop.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class InfluencerController extends GetxController {
  static InfluencerController get instance => Get.find();
  final influencerApi = Get.put(InfluencerApi());
  // final taskList = Get.put(TasksList);
  ALocalStorage storage = Get.find();
  final totalMoneySpent = 0.0.obs;
  final noOfTasks = 0.obs;
  final isLoadingRecent = true.obs;
  final spending = <Transaction>[].obs;
  final taskLists = <TasksList>[].obs;
  final listNextPage = 1.obs;
  final hasNext = true.obs;
  ScrollController capaignScrollController = ScrollController();

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
    try {
      getTaskAndMoneySpent();
      getSpending();
      load_task();
      scrollListener();
    } catch (e) {
      ASnackBar().dangerSackBar(
          title: "Oh Snap!", message: "We are unable to fetch data.");
    }
  }

  scrollListener() {
    capaignScrollController.addListener(() {
      if (capaignScrollController.position.atEdge) {
        bool isTop = capaignScrollController.position.pixels == 0;
        if (!isTop && listNextPage > 0) {
          print("Loading task");
          load_task();
          print("Loaded task");
        } else {
          // stop listening
          capaignScrollController.removeListener(scrollListener);
        }
      }
    });
  }

  Future<void> getTaskAndMoneySpent() async {
    final isConnected = await NetworkManager.instance.isConnected();
    if (!isConnected) return;
    try {
      final data = await influencerApi.task_add_money_spent();
      totalMoneySpent.value = double.parse(data["totalMoneySpent"].toString());
      print("Totals: " + data.toString());
      noOfTasks.value = int.parse(data["tasks"].toString());
    } catch (e) {
      print(e);
    }
  }

  Future<void> getSpending() async {
    final isConnected = await NetworkManager.instance.isConnected();
    if (!isConnected) return;
    try {
      final data = await influencerApi.get_recent_spending();
      spending.value = Transactions.fromJson(data).transactions;
      isLoadingRecent.value = false;
    } catch (e) {
      print(e);
    }
  }

  Future<void> load_task() async {
    final isConnected = await NetworkManager.instance.isConnected();
    if (!isConnected) return;
    try {
      final data = await influencerApi.get_task_list(page: listNextPage.value);
      taskLists.addAll(
          TasksList.tasksListFromJson(jsonEncode(data["tasks"]).toString()));
      data['hasNext'] == true ? listNextPage.value++ : listNextPage.value = 0;
      // isLoadingRecent.value = false;
    } catch (e) {
      print(e);
    }
  }
}
