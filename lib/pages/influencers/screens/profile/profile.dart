import 'package:enfluwence/pages/general/general_user.dart';
import 'package:enfluwence/pages/influencers/models/user.dart';
import 'package:enfluwence/utills/consts/colors.dart';
import 'package:enfluwence/utills/consts/size.dart';
import 'package:enfluwence/utills/consts/text.dart';
import 'package:enfluwence/utills/validators/validations.dart';
import 'package:enfluwence/widgets/buttons/primary_button.dart';
import 'package:enfluwence/widgets/buttons/round_button.dart';
import 'package:enfluwence/widgets/containers/card.dart';
import 'package:enfluwence/widgets/containers/page_container.dart';
import 'package:enfluwence/widgets/navigation/back_navigation.dart';
import 'package:enfluwence/widgets/profile/profile.dart';
import 'package:enfluwence/widgets/text/TitleP.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    GeneralUserController controller = Get.find();
    return BackNavigation(
      body: Obx(() => PageContainer(children: [
            ACard(
              child: Column(
                children: [
                  Row(
                    children: [
                      AProfile.profileAvatar,
                      SizedBox(width: 10),
                      TitleP(
                          title: User.user.username, paragraph: "Edit Profile"),
                    ],
                  ),
                ],
              ),
            ),
            // edit profile from
            ACard(
              child: Form(
                key: controller.updateProfile,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TitleP(
                        title: "Contact Info",
                        paragraph: "Update your Account Information"),
                    const SizedBox(height: ASizes.spaceBtwInputFields),
                    TextFormField(
                      controller: controller.name,
                      validator: (value) =>
                          AValidator.validateEmptyText("Name", value),
                      initialValue: controller.user.value.name,
                      decoration: const InputDecoration(
                        labelText: AText.name,
                      ),
                    ),
                    const SizedBox(height: ASizes.spaceBtwInputFields),
                    TextFormField(
                      // controller: controller.email,
                      validator: (value) => AValidator.validateEmail(value),
                      initialValue: controller.user.value.email,
                      decoration: const InputDecoration(
                        labelText: AText.email,
                      ),
                    ),
                    const SizedBox(height: ASizes.spaceBtwInputFields),
                    TextFormField(
                      controller: controller.phoneNumber,
                      validator: (value) =>
                          AValidator.validatePhoneNumber(value),
                      initialValue: controller.user.value.phoneNumber,
                      decoration: const InputDecoration(
                        labelText: AText.phoneNo,
                      ),
                    ),
                    const SizedBox(height: ASizes.spaceBtwSections),
                    TitleP(
                        title: "Social Media Contact",
                        paragraph: "Update link to social media accounts"),
                    const SizedBox(height: ASizes.spaceBtwInputFields),
                    TextFormField(
                      controller: controller.facebook,
                      validator: (value) =>
                          AValidator.validateUrl(value, name: "Facebook"),
                      initialValue: controller.user.value.facebook,
                      decoration: const InputDecoration(
                        labelText: "Facebook Link",
                        suffixIcon: Icon(Icons.link),
                      ),
                    ),
                    const SizedBox(height: ASizes.spaceBtwInputFields),
                    TextFormField(
                      controller: controller.whatsapp,
                      validator: (value) =>
                          AValidator.validateUrl(value, name: "Whatsapp"),
                      initialValue: controller.user.value.whatsapp,
                      decoration: const InputDecoration(
                        labelText: "Whatsapp Link",
                        suffixIcon: Icon(Icons.link),
                      ),
                    ),
                    const SizedBox(height: ASizes.spaceBtwInputFields),
                    TextFormField(
                      controller: controller.instagram,
                      validator: (value) =>
                          AValidator.validateUrl(value, name: "Instagram"),
                      initialValue: controller.user.value.instagram,
                      decoration: const InputDecoration(
                        labelText: "Instagram Link",
                        suffixIcon: Icon(Icons.link),
                      ),
                    ),
                    const SizedBox(height: ASizes.spaceBtwInputFields),
                    TextFormField(
                      controller: controller.twitter,
                      validator: (value) =>
                          AValidator.validateUrl(value, name: "Twitter/X"),
                      initialValue: controller.user.value.twitter,
                      decoration: const InputDecoration(
                        labelText: "X (Twitter) Link",
                        suffixIcon: Icon(Icons.link),
                      ),
                    ),
                    const SizedBox(height: ASizes.spaceBtwInputFields),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              "Deactivate Account",
                              style: TextStyle(
                                  color: AColor.danger,
                                  fontSize: ASizes.fontSizeMd),
                            )),
                        RoundButton(
                          name: "Save",
                          onPressed: () {
                            controller.update_profile();
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),

            const SizedBox(height: ASizes.spaceBtwInputFields),
          ])),
    );
  }
}
