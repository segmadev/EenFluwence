import 'dart:convert';
import 'package:enfluwence/pages/general/general_user.dart';
import 'package:enfluwence/utills/consts/api_url.dart';
import 'package:enfluwence/utills/helpers/api_helper.dart';
import 'package:enfluwence/utills/local_storage/storage_utility.dart';
import 'package:http/http.dart' as http;

class UserApi {
  final isInfluncer = GeneralUserController.isInfluencer();
  Future<dynamic> get_balance() async {
    final end_point_url =
        isInfluncer ? ApiUrl.influencer_balance : ApiUrl.user_balance;

    final token = ALocalStorage().readData("token") ?? null;
    if (token == null) return null;
    final headers = {
      'token': 'Bearer $token',
    };
    var pathUrl = ApiUrl.base_url + end_point_url;
    final url = Uri.parse(pathUrl);
    final response = await http.get(url, headers: headers);
    print(response.body);
    try {
      final data = ApiHelper.processResponse(response);
      print(data['data']['balance']);
      return data['data']['balance'];
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> get_user() async {
    final token = ALocalStorage().readData("token") ?? null;
    if (token == null) return null;
    final headers = {
      'token': 'Bearer {{$token}}',
    };
    var pathUrl = ApiUrl.base_url + ApiUrl.get_influencer;
    final url = Uri.parse(pathUrl);
    final response = await http.post(url, headers: headers);
    try {
      final data = ApiHelper.processResponse(response);
      return data;
    } catch (e) {
      // print(e);
      throw e;
    }
  }
}
