import 'package:enfluwence/pages/auth/screens/OTP/otp.dart';
import 'package:enfluwence/utills/consts/size.dart';
import 'package:enfluwence/utills/consts/text.dart';
import 'package:enfluwence/widgets/buttons/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

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
              labelText: AText.username,
            ),
          ),
          const SizedBox(height: ASizes.spaceBtwInputFields),
          TextFormField(
            decoration: const InputDecoration(
                labelText: AText.password, suffixIcon: Icon(Iconsax.eye_slash)),
          ),
          const SizedBox(height: ASizes.spaceBtwInputFields),
          TextFormField(
            decoration: const InputDecoration(
                labelText: AText.confirmPassword,
                suffixIcon: Icon(Iconsax.eye_slash)),
          ),
          const SizedBox(height: ASizes.spaceBtwInputFields),

          // Sign In Button
          PrimaryButton(
              name: AText.signup,
              onPressed: () {
                Get.to(const OTPScreen());
              }),
        ],
      ),
    );
  }
}
