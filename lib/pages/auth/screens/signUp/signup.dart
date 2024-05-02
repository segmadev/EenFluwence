import 'package:enfluwence/pages/auth/controllers/signup/signup_controller.dart';
import 'package:enfluwence/pages/auth/screens/OTP/otp.dart';
import 'package:enfluwence/utills/consts/size.dart';
import 'package:enfluwence/utills/consts/text.dart';
import 'package:enfluwence/utills/validators/validations.dart';
import 'package:enfluwence/widgets/buttons/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    return Scaffold(
      body: Form(
        key: controller.signupFromKey,
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
            TextFormField(
              controller: controller.username,
              validator: (value) => AValidator.validateUsername(value),
              decoration: const InputDecoration(
                labelText: AText.username,
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
            // TextFormField(
            //   decoration: const InputDecoration(
            //       labelText: AText.confirmPassword,
            //       suffixIcon: Icon(Iconsax.eye_slash)),
            // ),
            // const SizedBox(height: ASizes.spaceBtwInputFields),

            // Sign In Button
            PrimaryButton(
                name: AText.signup,
                onPressed: () {
                  controller.signup();
                }),
          ],
        ),
      ),
    );
  }
}
