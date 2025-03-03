import 'dart:convert';

import 'package:enfluwence/http/task/task_api.dart';
import 'package:enfluwence/pages/influencers/models/tasks.dart';
import 'package:enfluwence/utills/helpers/network_manager.dart';
import 'package:get/get.dart';

class UserTaskController extends GetxController {
  static UserTaskController get instance => Get.find();
  final TaskApi taskApi = Get.find();
  late Rx<TasksList> task;
  final loadingTask = true.obs;

  get_task(String id) async {
    final isConnected = await NetworkManager.instance.isConnected();
    if (!isConnected) return;
    try {
      final response = await taskApi.get_task(id);
      print(jsonEncode(response).toString());
      task.value = TasksList.fromJson(jsonDecode(response["task"]));
    } catch (e) {
      print(e);
    }
  }
}
