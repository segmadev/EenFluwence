import 'package:enfluwence/pages/general/controllers/general_user.dart';
import 'package:enfluwence/pages/general/models/user.dart';
import 'package:enfluwence/pages/general/screens/profile/profile_form.dart';
import 'package:enfluwence/utills/consts/colors.dart';
import 'package:enfluwence/utills/consts/size.dart';
import 'package:enfluwence/utills/consts/text.dart';
import 'package:enfluwence/utills/helpers/helper_functions.dart';
import 'package:enfluwence/utills/popups/loaders.dart';
import 'package:enfluwence/utills/validators/validations.dart';
import 'package:enfluwence/widgets/buttons/round_button.dart';
import 'package:enfluwence/widgets/containers/card.dart';
import 'package:enfluwence/widgets/containers/page_container.dart';
import 'package:enfluwence/widgets/navigation/back_navigation.dart';
import 'package:enfluwence/widgets/profile/profile.dart';
import 'package:enfluwence/widgets/text/TitleP.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    GeneralUserController controller = Get.find();
    return BackNavigation(

      body: Obx(() => !controller.isLoading.value
          ? PageContainer(children: [
              ACard(
                child: Column(
                  children: [
                    Row(
                      children: [
                        AProfile.profileAvatar,
                        SizedBox(width: 10),
                        TitleP(
                            title: User.user.username,
                            paragraph: "Edit Profile"),
                      ],
                    ),
                  ],
                ),
              ),
              // edit profile from
              const ProfileForm(),
              const SizedBox(height: ASizes.spaceBtwInputFields),
            ])
          : AAnimationLoaderWidget()),
    );
  }
}
