import 'dart:convert';

import 'package:enfluwence/pages/influencers/models/task.dart';
import 'package:enfluwence/utills/consts/api_url.dart';
import 'package:enfluwence/utills/helpers/api_helper.dart';
import 'package:enfluwence/utills/local_storage/storage_utility.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class TaskApi extends GetxController {
  static TaskApi get instance => Get.find();

  Future<dynamic> createTask(Task data) async {
    var bodyData = data.toJson();
    var pathUrl = ApiUrl.base_url + ApiUrl.create_task;
    final url = Uri.parse(pathUrl); //Repclace Your Endpoint
    final token = ALocalStorage().readData("token") ?? null;
    final headers = {
      'Content-Type': 'application/json',
      'token': 'Bearer $token'
    };
    final body = jsonEncode(bodyData);
    final response = await http.post(url, headers: headers, body: body);
    print(response.body);
    if (response.statusCode != 201 &&
        response.statusCode != 200 &&
        response.statusCode != 400) {
      throw 'Failed to load data';
    }
    try {
      final data = ApiHelper.processResponse(response);
      return data;
    } catch (e) {
      throw e;
    }
  }
}
