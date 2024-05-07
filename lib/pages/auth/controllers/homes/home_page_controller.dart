import 'package:get/get.dart';

class HomePageController extends GetxController {
  static HomePageController get instance => Get.find();
  @override
  void onInit() {
    super.onInit();
    print("Welcome Home");
  }


}
