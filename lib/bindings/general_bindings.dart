import 'package:enfluwence/pages/general/controllers/general_user.dart';
import 'package:enfluwence/pages/general/models/user.dart';
import 'package:enfluwence/utills/helpers/network_manager.dart';
import 'package:get/get.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkManager());
    Get.put(User);
  }
}
