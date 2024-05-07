import 'dart:convert';
import 'package:enfluwence/http/task/task_api.dart';
import 'package:enfluwence/pages/influencers/models/task.dart';
import 'package:enfluwence/pages/influencers/screens/tasks/campaign/add_caption.dart';
import 'package:enfluwence/pages/influencers/screens/tasks/other_task/questions/add_questions.dart';
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
  Rx<int> index = 0.obs;
  Rx<Task> taskData = Task.emptyTask().obs;
  ALocalStorage storage = Get.find();
  String? taskType = "Social Media Campaign";
  var totalNumberOfEngagements = TextEditingController();
  var costPerEngagement = TextEditingController();
  Rx<String>? socialMedia = "".obs;
  var text = TextEditingController();
  var url = TextEditingController();
  // from keys
  GlobalKey<FormState> taskFromKey = GlobalKey<FormState>();
  GlobalKey<FormState> questionFromKey = GlobalKey<FormState>();
  GlobalKey<FormState> captionFromKey = GlobalKey<FormState>();

  ScrollController questionScrollController = ScrollController();

  @override
  Future<void> onInit() async {
    super.onInit();
    if (storage.readData("taskData") != null) {
      print(storage.readData("taskData"));
      taskData.value = Task.fromJson(await storage.readData("taskData"));
    }
    setInitialValue();
  }

  setInitialValue() {
    totalNumberOfEngagements.text =
        taskData.value.totalNumberOfEngagements.toString();
    costPerEngagement.text = taskData.value.costPerEngagement.toString();
  }

  var captionList = <Caption>[].obs;
  Rx<Question> question = Question.emptyQuestion().obs;
  // static createTask(Task task) {}
  addChoice(Question question) {
    question.choices!
        .add(Choice(index: AHelperFunctions.getRondomNums(), text: ""));
  }

  removeChoice(Choice choice, Question question) {
    question.choices!.remove(choice);
  }

  bool addQuestion() {
    // if (question.value.answerType != "Multiple Choice") {
    //   print("Please select");
    //   question.value.choices = null;
    // }
    // if (taskData.questions == null) taskData.questions = [];
    taskData.value.questions!.add(Question.emptyQuestion());
    ASnackBar().successSackBar(
        title: "Added",
        duration: 1,
        message: "Question added",
        position: "top");
    return true;
  }

  bool removeQuestion(Question question) {
    taskData.value.questions!.remove(question);
    ASnackBar().dangerSackBar(
        title: "Removed",
        duration: 1,
        message: "Question removed",
        position: "top");
    return true;
  }

  addCaption() {
    if (!captionFromKey.currentState!.validate()) return;
    try {
      captionList.add(Caption(
          index: AHelperFunctions.getRondomNums(),
          socialMedia: socialMedia!.value,
          text: text.text,
          url: url.text));
      text.text = "";
      url.text = "";
      taskData.value.captions = captionList;
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
      taskData.value.taskType = taskType;
      taskData.value.totalNumberOfEngagements =
          int.parse(totalNumberOfEngagements.text);
      taskData.value.costPerEngagement = int.parse(costPerEngagement.text);
      if (taskData.value.taskType == "Social Media Campaign") {
        taskData.value.captions = [];
      } else {
        taskData.value.questions = [Question.emptyQuestion()].obs;
      }
      final mytask = taskData.toJson();
      storage.saveData("taskData", jsonEncode(mytask));
      print(storage.readData("taskData"));
      taskData.value.taskType == "Social Media Campaign"
          ? Get.to(const AddCaption())
          : Get.to(const AddQuestions());
    } catch (e) {
      AFullScreenLoader.stopLoading();
      ASnackBar().dangerSackBar(title: "Oh Snap!", message: e.toString());
    }
  }

  publishTask() async {
    try {
      print(taskData.value.taskType);

      if (taskData.value.taskType == "Other Tasks" &&
          !questionFromKey.currentState!.validate()) {
        ASnackBar().warningSackBar(
            title: "Error",
            duration: 3,
            message: "Make sure all questions are filled correctly",
            position: "top");
        return;
      }

      AFullScreenLoader.openLoadingDialog(
          AText.processInfo, AAssets.docerAnimation);
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) return;
      final response = await taskApi.createTask(taskData.value);
      AFullScreenLoader.stopLoading();
      ASnackBar().successSackBar(
          title: "Great!", message: "Task Created Successfully");
      Get.to(() => SuccessSCreen(
          text: "Task Created Successfully.",
          animation: AAssets.successAnimation));
    } catch (e) {
      AFullScreenLoader.stopLoading();
      ASnackBar().dangerSackBar(title: "Oh Snap!", message: e.toString());
    }
  }
}
