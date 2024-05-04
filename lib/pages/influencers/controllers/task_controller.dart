import 'dart:convert';
import 'package:enfluwence/http/task/task_api.dart';
import 'package:enfluwence/pages/influencers/models/task.dart';
import 'package:enfluwence/pages/influencers/screens/tasks/campaign/add_caption.dart';
import 'package:enfluwence/utills/consts/asset_paths.dart';
import 'package:enfluwence/utills/consts/text.dart';
import 'package:enfluwence/utills/helpers/helper_functions.dart';
import 'package:enfluwence/utills/helpers/network_manager.dart';
import 'package:enfluwence/utills/local_storage/storage_utility.dart';
import 'package:enfluwence/utills/popups/full_screen_loader.dart';
import 'package:enfluwence/utills/popups/snack_bar_pop.dart';
import 'package:enfluwence/widgets/pages/success_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TaskController extends GetxController {
  static TaskController get instance => Get.find();
  var taskApi = Get.put(TaskApi());
  Task taskData = Task.emptyTask();
  ALocalStorage storage = Get.find();
  @override
  String? taskType = "Social Media Campaign";
  var totalNumberOfEngagements = TextEditingController();
  var costPerEngagement = TextEditingController();
  String? socialMedia = "";
  var text = TextEditingController();
  var url = TextEditingController();
  GlobalKey<FormState> taskFromKey = GlobalKey<FormState>();
  GlobalKey<FormState> captionFromKey = GlobalKey<FormState>();

  Future<void> onInit() async {
    super.onInit();
    if (storage.readData("taskData") != null) {
      print(storage.readData("taskData"));
      taskData = Task.fromJson(await storage.readData("taskData"));
    }
    setInitialValue();
  }

  setInitialValue() {
    totalNumberOfEngagements.text =
        taskData.totalNumberOfEngagements.toString();
    costPerEngagement.text = taskData.costPerEngagement.toString();
  }

  var captionList = <Caption>[].obs;
  static createTask(Task task) {}

  addCaption() {
    if (!captionFromKey.currentState!.validate()) return;
    try {
      captionList.add(Caption(
          index: AHelperFunctions.getRondomNums(),
          socialMedia: socialMedia,
          text: text.text,
          url: url.text));
      text.text = "";
      url.text = "";
      taskData.captions = captionList;
      storage.saveData("taskData", jsonEncode(taskData.toJson()));
    } catch (e) {
      print(e);
    }
  }

  removeCaption({required int index}) {
    captionList.removeWhere((captionList) => captionList.index == index);
    print(index);
  }

  create_new_task() {
    try {
      // AFullScreenLoader.openLoadingDialog(
      //     AText.processInfo, AAssets.docerAnimation);
      if (!taskFromKey.currentState!.validate()) return;
      taskData.taskType = taskType;
      taskData.totalNumberOfEngagements =
          int.parse(totalNumberOfEngagements.text);
      taskData.costPerEngagement = int.parse(costPerEngagement.text);
      final mytask = taskData.toJson();
      storage.saveData("taskData", jsonEncode(mytask));
      print(storage.readData("taskData"));
      Get.to(const AddCaption());
    } catch (e) {
      ASnackBar().dangerSackBar(title: "Oh Snap!", message: e.toString());
    } finally {
      // AFullScreenLoader.stopLoading();
    }
  }

  publish_task() async {
    try {
      AFullScreenLoader.openLoadingDialog(
          AText.processInfo, AAssets.docerAnimation);
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) return;
      final response = await taskApi.createTask(taskData);
      AFullScreenLoader.stopLoading();
      ASnackBar().successSackBar(
          title: "Great!", message: "Task Created Successfully");
      Get.to(() => SuccessSCreen(
          text: "Task Created Successfully.",
          animation: AAssets.successAnimation));
    } catch (e) {
      ASnackBar().dangerSackBar(title: "Oh Snap!", message: e.toString());
    } finally {
      AFullScreenLoader.stopLoading();
    }
  }
}
