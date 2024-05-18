import 'package:enfluwence/pages/auth/controllers/signin/signin_controller.dart';
import 'package:enfluwence/utills/consts/size.dart';
import 'package:enfluwence/utills/consts/text.dart';
import 'package:enfluwence/utills/validators/validations.dart';
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
    final controller = Get.put(SignInController());
    return Form(
      key: controller.signInFromKey,
      child: Column(
        children: [
          // Email
          TextFormField(
            controller: controller.email,
            validator: (value) => AValidator.validateEmail(value),
            decoration: const InputDecoration(
              labelText: AText.email,
            ),
          ),
          const SizedBox(height: ASizes.spaceBtwInputFields),
          Obx(() => TextFormField(
                controller: controller.password,
                obscureText: controller.hidePassword.value,
                validator: (value) => AValidator.validatePassword(value),
                decoration: InputDecoration(
                    labelText: AText.password,
                    suffixIcon: IconButton(
                        onPressed: () {
                          controller.hidePassword.value =
                              !controller.hidePassword.value;
                        },
                        icon: controller.hidePassword.value
                            ? Icon(Iconsax.eye_slash)
                            : Icon(Iconsax.eye))),
              )),
          const SizedBox(height: ASizes.spaceBtwInputFields),

          const SizedBox(height: ASizes.spaceBtwInputFields),
          Row(
            children: [
              // Row(
              //   children: [
              //     Checkbox(
              //       value: true,
              //       onChanged: (value) {},
              //     ),
              //     const Text(AText.rememberMe),
              //   ],
              // ),

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
              controller.signIn();
              // Get.to(const NavigationMenu());
            },
          ),
        ],
      ),
    );
  }
}
