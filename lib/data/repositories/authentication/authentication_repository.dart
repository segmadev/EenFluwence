import 'package:enfluwence/pages/auth/screens/OTP/otp.dart';
import 'package:enfluwence/pages/auth/screens/auth.dart';
import 'package:enfluwence/pages/auth/screens/preview/page_preview.dart';
import 'package:enfluwence/pages/influencers/models/user.dart';
import 'package:enfluwence/utills/local_storage/storage_utility.dart';
import 'package:enfluwence/widgets/navigation/navigation_menu.dart';
import 'package:get/get.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();
  // const AuthenticationRepository({super.key});

  final deviceStorage = Get.put(ALocalStorage());
  @override
  void onReady() {
    screenRedirect();
  }

  screenRedirect() async {
    // deviceStorage.clearAll();
    // print(deviceStorage.readData("currentUser"));
    // print("Current User:" + deviceStorage.readData("currentUser"));
    if (deviceStorage.readData("currentUser") == null) {
      deviceStorage.saveDataIfNull("IsFirstTime", true);
      deviceStorage.readData('IsFirstTime') != true
          ? Get.offAll(() => const AuthScreen())
          : Get.offAll(() => const APagePreview());
    }
    final user = Influencer.fromJson(deviceStorage.readData("currentUser"));
    if (!user.isVerified) {
      Get.offAll(() => const OTPScreen());
    } else {
      Get.offAll(() => const NavigationMenu());
    }
  }
  // signup
}
