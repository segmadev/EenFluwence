import 'package:enfluwence/pages/influencers/models/user.dart';
import 'package:enfluwence/utills/consts/colors.dart';
import 'package:enfluwence/utills/consts/size.dart';
import 'package:enfluwence/utills/consts/text.dart';
import 'package:enfluwence/widgets/buttons/primary_button.dart';
import 'package:enfluwence/widgets/buttons/round_button.dart';
import 'package:enfluwence/widgets/containers/card.dart';
import 'package:enfluwence/widgets/containers/page_container.dart';
import 'package:enfluwence/widgets/navigation/back_navigation.dart';
import 'package:enfluwence/widgets/profile/profile.dart';
import 'package:enfluwence/widgets/text/TitleP.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BackNavigation(
      body: PageContainer(children: [
        ACard(
          child: Column(
            children: [
              Row(
                children: [
                  AProfile.profileAvatar,
                  SizedBox(width: 10),
                  TitleP(title: User.info['name'], paragraph: "Edit Profile"),
                ],
              ),
            ],
          ),
        ),
        // edit profile from
        ACard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TitleP(
                  title: "Contact Info",
                  paragraph: "Update your Account Information"),
              const SizedBox(height: ASizes.spaceBtwInputFields),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: AText.firstName,
                ),
              ),
              const SizedBox(height: ASizes.spaceBtwInputFields),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: AText.lastName,
                ),
              ),
              const SizedBox(height: ASizes.spaceBtwInputFields),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: AText.email,
                ),
              ),
              const SizedBox(height: ASizes.spaceBtwInputFields),
              TextFormField(
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
                decoration: const InputDecoration(
                  labelText: "Facebook Link",
                  suffixIcon: Icon(Icons.link),
                ),
              ),
              const SizedBox(height: ASizes.spaceBtwInputFields),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Whatsapp Link",
                  suffixIcon: Icon(Icons.link),
                ),
              ),
              const SizedBox(height: ASizes.spaceBtwInputFields),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Instagram Link",
                  suffixIcon: Icon(Icons.link),
                ),
              ),
              const SizedBox(height: ASizes.spaceBtwInputFields),
              TextFormField(
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
                            color: AColor.danger, fontSize: ASizes.fontSizeMd),
                      )),
                  RoundButton(name: "Save"),
                ],
              )
            ],
          ),
        ),

        const SizedBox(height: ASizes.spaceBtwInputFields),
      ]),
    );
  }
}
