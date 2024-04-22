import 'package:enfluwence/utills/consts/size.dart';
import 'package:enfluwence/utills/consts/text.dart';
import 'package:enfluwence/widgets/buttons/primary_button.dart';
import 'package:enfluwence/widgets/navigation/navigation_menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Column(
        children: [
          // Email
          TextFormField(
            decoration: const InputDecoration(
              labelText: AText.email,
            ),
          ),
          const SizedBox(height: ASizes.spaceBtwInputFields),
          TextFormField(
            decoration: const InputDecoration(
                labelText: AText.password, suffixIcon: Icon(Iconsax.eye_slash)),
          ),
          const SizedBox(height: ASizes.spaceBtwInputFields),

          const SizedBox(height: ASizes.spaceBtwInputFields),
          Row(
            children: [
              Row(
                children: [
                  Checkbox(
                    value: true,
                    onChanged: (value) {},
                  ),
                  const Text(AText.rememberMe),
                ],
              ),

              /// Forget Password
              const Spacer(),
              TextButton(
                onPressed: () {},
                child: const Text(AText.forgetPassword),
              ),
            ],
          ),
          const SizedBox(height: ASizes.spaceBtwInputFields),

          // Sign In Button
          PrimaryButton(
            name: AText.signin,
            onPressed: () {
              Get.to(const NavigationMenu());
            },
          ),
        ],
      ),
    );
  }
}
