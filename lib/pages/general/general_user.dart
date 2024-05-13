import 'package:enfluwence/http/wallet/user.dart';
import 'package:enfluwence/pages/influencers/models/user.dart';
import 'package:get/get.dart';

class GeneralUserController extends GetxController {
  static GeneralUserController get instance => Get.find();
  static dynamic currentUser = storage.readData("currentUser");
  static dynamic token = storage.readData("token");
  Rx<double> balance = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    getUserBalance();
    
  }

  static bool isInfluencer() {
    return currentUser['isInfluencer'];
  }

  static get_user() async {
    await UserApi().get_balance();
  }

  Future<void> getUserBalance() async {
    try {
      var data = await UserApi().get_balance();
      this.balance(double.parse(data.toString()));
    } catch (e) {
      print(e);
      // return 0.44;
    }
  }
  // static balance() async =>
}
