import 'dart:convert';
import 'package:enfluwence/pages/general/controllers/general_user.dart';
import 'package:enfluwence/pages/general/models/user.dart';
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

  // add for fund wallet
  Future<dynamic> fund_wallet(String amount) async {
    // return error if not influencer
    if (!isInfluncer) {
      throw 'You are not an influencer';
    }
    final token = ALocalStorage().readData("token") ?? null;
    if (token == null) return null;
    final headers = {
      'token': 'Bearer $token',
    };

    final body = json.encode({
      "amount": amount,
    });
    final endpointUrl = ApiUrl.fund_wallet;
    final pathUrl = ApiUrl.base_url + endpointUrl;
    final url = Uri.parse(pathUrl);
    final response = await http.post(url, headers: headers);

    try {
      final data = ApiHelper.processResponse(response);
      return data;
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> get_user() async {
    final token = ALocalStorage().readData("token") ?? null;
    if (token == null) return null;
    final headers = {
      'token': 'Bearer $token',
    };
    var pathUrl = ApiUrl.base_url + ApiUrl.get_user;
    final url = Uri.parse(pathUrl);
    final response = await http.get(url, headers: headers);
    if (response.statusCode != 201 &&
        response.statusCode != 200 &&
        response.statusCode != 400) {
      throw 'Failed to load data';
    }

    try {
      final data = ApiHelper.processResponse(response);
      return data['data']['user'];
    } catch (e) {
      // print(e);
      throw e;
    }
  }

  static Future<dynamic> updateUser(UserUpdate user) async {
    final token = ALocalStorage().readData("token") ?? null;
    final body = json.encode(user.toJson());
    if (token == null) return null;
    final headers = {
      'token': 'Bearer $token',
      'Content-Type': 'application/json',
    };
    var pathUrl = ApiUrl.base_url + ApiUrl.update_user;
    final url = Uri.parse(pathUrl);
    final response = await http.patch(url, headers: headers, body: body);
    if (response.statusCode != 201 &&
        response.statusCode != 200 &&
        response.statusCode != 400) {
      throw 'Failed to update account';
    }
    try {
      final data = ApiHelper.processResponse(response);
      return data;
    } catch (e) {
      // print(e);
      throw e;
    }
  }
}
