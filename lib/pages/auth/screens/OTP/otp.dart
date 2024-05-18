import 'package:enfluwence/data/repositories/authentication/authentication_repository.dart';
import 'package:enfluwence/pages/auth/controllers/verify/verify_controller.dart';
import 'package:enfluwence/pages/auth/screens/auth.dart';
import 'package:enfluwence/pages/auth/screens/success/success.dart';
import 'package:enfluwence/pages/general/models/user.dart';
import 'package:enfluwence/utills/consts/colors.dart';
import 'package:enfluwence/utills/consts/icons.dart';
import 'package:enfluwence/utills/consts/size.dart';
import 'package:enfluwence/utills/consts/text.dart';
import 'package:enfluwence/utills/validators/validations.dart';
import 'package:enfluwence/widgets/buttons/primary_button.dart';
import 'package:enfluwence/widgets/header/auth_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyController());
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(ASizes.lg),
        child: Form(
          key: controller.verifyFromKey,
          child: Column(
            children: [
              const Center(child: AuthHeader()),
              const SizedBox(
                height: ASizes.spaceBtwSections,
              ),
              SizedBox(
                child: Column(children: [
                  Text(
                    AText.otpTitle,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(
                    height: ASizes.spaceBtwItems,
                  ),
                  Text(
                    AText.otpDescription,
                    style: Theme.of(context).textTheme.bodyMedium,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    User.user.email ?? "",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: AColor.darkSuccess),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: ASizes.spaceBtwSections,
                  ),
                  TextFormField(
                    controller: controller.otp,
                    validator: (value) =>
                        AValidator.validateEmptyText('OTP', value),
                    decoration: const InputDecoration(
                      labelText: "OTP",
                    ),
                  ),
                  // resend otp align to the right
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          alignment: Alignment.bottomRight,
                          backgroundColor: AColor.transparent,
                        ),
                        onPressed: () {},
                        child: InkWell(
                          onTap: () {
                            controller.resendotp();
                          },
                          child: Row(
                            children: [
                              Icon(
                                AIcons.reload,
                                color: Theme.of(context).primaryColor,
                                size: ASizes.fontSizeSm,
                              ),
                              Text(
                                AText.reSendOTP,
                                style: Theme.of(context).textTheme.bodySmall,
                                textAlign: TextAlign.end,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: ASizes.spaceBtwSections,
                  ),
                  // const ACountDown(seconds: 20),
                  PrimaryButton(
                      name: AText.tContinue,
                      onPressed: () {
                        controller.verifyEmail();
                      }),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextButton(
                        onPressed: () {
                          AuthenticationRepository.instance.logout();
                        },
                        child: Text(
                          "Login Account",
                          style: Theme.of(context).textTheme.bodyLarge,
                        )),
                  )
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
