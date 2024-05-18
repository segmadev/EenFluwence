import 'package:enfluwence/pages/general/controllers/general_user.dart';
import 'package:enfluwence/pages/general/screens/profile/profile.dart';
import 'package:enfluwence/pages/general/screens/profile/profile_form.dart';
import 'package:enfluwence/utills/consts/size.dart';
import 'package:enfluwence/widgets/containers/card.dart';
import 'package:enfluwence/widgets/containers/page_container.dart';
import 'package:enfluwence/widgets/text/TitleP.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateProfile extends StatelessWidget {
  const UpdateProfile({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(GeneralUserController());
    return const Scaffold(
      body: PageContainer(
        children: [
          ACard(
            child: TitleP(title: "Update Additional Information"),
          ),
          // SizedBox(height: ASizes.defaultSpace),
          ProfileForm(
            isFirstUpdate: true,
          ),
        ],
      ),
    );
  }
}
