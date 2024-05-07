import 'package:enfluwence/app.dart';
import 'package:enfluwence/data/repositories/authentication/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  await GetStorage.init();
  Get.put(AuthenticationRepository());
  runApp(const MainApp());
}
