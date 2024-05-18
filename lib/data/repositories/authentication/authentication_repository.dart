import 'package:enfluwence/pages/auth/screens/OTP/otp.dart';
import 'package:enfluwence/pages/auth/screens/auth.dart';
import 'package:enfluwence/pages/auth/screens/preview/page_preview.dart';
import 'package:enfluwence/pages/general/general_user.dart';
import 'package:enfluwence/pages/influencers/models/user.dart';
import 'package:enfluwence/pages/influencers/screens/profile/update_profile.dart';
import 'package:enfluwence/utills/local_storage/storage_utility.dart';
import 'package:enfluwence/utills/popups/snack_bar_pop.dart';
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
    print("Got here: " + deviceStorage.readData("currentUser").toString());
    try {
      if (deviceStorage.readData("currentUser") == null) {
        deviceStorage.saveDataIfNull("IsFirstTime", true);
        deviceStorage.readData('IsFirstTime') != true
            ? Get.offAll(const AuthScreen())
            : Get.offAll(const APagePreview());
      } else {
        final user = User.user;
        print("Go to profile");
        if (!user.isVerified) {
          Get.offAll(const OTPScreen());
        } else if (user.name == null) {
          Get.offAll(const UpdateProfile());
        } else {
          Get.offAll(const NavigationMenu());
        }
      }
    } catch (e) {
      // logout();
    }
  }

// logout
  void logout() async {
    await deviceStorage.clearAll();
    deviceStorage.saveDataIfNull("IsFirstTime", false);
    ASnackBar().dangerSackBar(title: "Logout", message: "Account logout");
    screenRedirect();
  }
  // signup
}
