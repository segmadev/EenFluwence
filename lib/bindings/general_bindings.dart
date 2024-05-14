import 'package:enfluwence/pages/influencers/models/user.dart';
import 'package:enfluwence/utills/helpers/network_manager.dart';
import 'package:get/get.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkManager());
    Get.put(User);
  }
}
