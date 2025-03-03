import 'dart:convert';

import 'package:enfluwence/data/repositories/authentication/authentication_repository.dart';
import 'package:enfluwence/http/influencer/influencer_api.dart';
import 'package:enfluwence/http/task/task_api.dart';
import 'package:enfluwence/pages/influencers/models/tasks.dart';
import 'package:enfluwence/pages/transactions/models/transactions.dart';
import 'package:enfluwence/utills/consts/api_url.dart';
import 'package:enfluwence/utills/helpers/network_manager.dart';
import 'package:enfluwence/utills/local_storage/storage_utility.dart';
import 'package:enfluwence/utills/popups/snack_bar_pop.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();
  final taskApi = Get.put(TaskApi());
  // final taskList = Get.put(TasksList);
  ALocalStorage storage = Get.find();
  final taskCompleted = 0.0.obs;
  final totalEarnings = 0.obs;
  final earnings = 0.obs;
  final expenditure = 0.obs;
  final isLoadingTasks = true.obs;
  final isLoadingNewTasks = false.obs;
  final spending = <Transaction>[].obs;
  final taskLists = <TasksList>[].obs;
  final listNextPage = 1.obs;
  final hasNext = true.obs;
  ScrollController avilableTasksScrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
    iniAllDtata();
    scrollListener();
  }

  iniAllDtata() {
    if (storage.readData("token") == null ||
        storage.readData("currentUser") == null) {
      AuthenticationRepository().screenRedirect();
    }
    try {
      load_task();
    } catch (e) {
      ASnackBar().dangerSackBar(
          title: "Oh Snap!", message: "We are unable to fetch data.");
    }
  }

  Future<void> load_task() async {
    final isConnected = await NetworkManager.instance.isConnected();
    if (!isConnected) return;
    try {
      final data = await taskApi.get_task_list(
          page: listNextPage.value, endpoint: ApiUrl.get_avilable_task);
      taskLists.addAll(TasksList.tasksListFromJson(
          jsonEncode(data["availableTasks"]).toString()));
      data['hasNext'] == true ? listNextPage.value++ : listNextPage.value = 0;
      print("Lenght is: " + taskLists.length.toString());
      isLoadingTasks.value = false;
    } catch (e) {
      print("Error is: $e");
    }
  }

  scrollListener() {
    avilableTasksScrollController.addListener(() {
      if (avilableTasksScrollController.position.atEdge) {
        bool isTop = avilableTasksScrollController.position.pixels == 0;
        if (!isTop && listNextPage > 0) {
          print("Loading task");
          load_task();
          print("Loaded task");
        } else {
          // stop listening
          avilableTasksScrollController.removeListener(scrollListener);
        }
      }
    });
  }
}
