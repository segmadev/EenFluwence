import 'package:enfluwence/utills/consts/size.dart';
import 'package:enfluwence/utills/consts/text.dart';
import 'package:flutter/material.dart';
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
          SizedBox(height: ASizes.spaceBtwInputFields),
          TextFormField(
            decoration: const InputDecoration(
              labelText: AText.username,
            ),
          ),
          SizedBox(height: ASizes.spaceBtwInputFields),
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
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text(AText.signup),
            ),
          ),
        ],
      ),
    );
  }
}
