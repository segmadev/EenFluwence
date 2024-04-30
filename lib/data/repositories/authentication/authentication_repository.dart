import 'package:enfluwence/pages/auth/screens/auth.dart';
import 'package:enfluwence/pages/auth/screens/preview/page_preview.dart';
import 'package:enfluwence/widgets/local_storage/storage_utility.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();
  // const AuthenticationRepository({super.key});

  final deviceStorage = ALocalStorage();

  @override
  void onReady() {
    screenRedirect();
  }

  screenRedirect() async {
    deviceStorage.saveDataIfNull("IsFirstTime", true);
    deviceStorage.readData('IsFirstTime') != true
        ? Get.offAll(() => const AuthScreen())
        : Get.offAll(() => const APagePreview());
  }
}
