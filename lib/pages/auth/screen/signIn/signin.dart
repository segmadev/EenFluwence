import 'package:enfluwence/utills/consts/size.dart';
import 'package:enfluwence/utills/consts/text.dart';
import 'package:enfluwence/widgets/buttons/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

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
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
