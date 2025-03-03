import 'dart:convert';

import 'package:enfluwence/pages/general/models/task.dart';
import 'package:enfluwence/utills/consts/api_url.dart';
import 'package:enfluwence/utills/consts/config.dart';
import 'package:enfluwence/utills/helpers/api_helper.dart';
import 'package:enfluwence/utills/local_storage/storage_utility.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class TaskApi extends GetxController {
  static TaskApi get instance => Get.find();
  final token = ALocalStorage().readData("token") ?? null;
  final noOfFecth = AConfig.noOfFetch.toString();
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
    print(body);
    final response = await http.post(url, headers: headers, body: body);
    print("Create task body: " + response.statusCode.toString());
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

  Future<dynamic> get_task_list({int page = 1, endpoint = null}) async {
    final token = ALocalStorage().readData("token") ?? null;
    if (token == null) return null;
    endpoint = endpoint ?? ApiUrl.influencer_task_list;
    final headers = {
      'token': 'Bearer $token',
    };
    var pathUrl = ApiUrl.base_url + endpoint + "?page=$page&params=$noOfFecth";
    print("Path: " + pathUrl);
    final url = Uri.parse(pathUrl);
    final response = await http.get(url, headers: headers);
    print(response.statusCode);
    try {
      final data = ApiHelper.processResponse(response);
      return data["data"];
    } catch (e) {
      print(e);
      throw e;
    }
  }

  Future<dynamic> get_task(id) async {
    final token = ALocalStorage().readData("token");
    if (token == null) return null;
    final headers = {
      'token': 'Bearer $token',
    };
    var pathUrl = "${ApiUrl.base_url}${ApiUrl.get_task}/$id";
    final url = Uri.parse(pathUrl);
    final response = await http.get(url, headers: headers);
    print(response.statusCode);
    try {
      final data = ApiHelper.processResponse(response);
      return data["data"];
    } catch (e) {
      print(e);
      throw e;
    }
  }
}
