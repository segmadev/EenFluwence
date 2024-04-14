import 'package:enfluwence/pages/auth/screen/OTP/otp_Input.dart';
import 'package:enfluwence/pages/auth/screen/success/success.dart';
import 'package:enfluwence/utills/consts/colors.dart';
import 'package:enfluwence/utills/consts/size.dart';
import 'package:enfluwence/utills/consts/text.dart';
import 'package:enfluwence/widgets/buttons/primary_button.dart';
import 'package:enfluwence/widgets/countdown/countdown.dart';
import 'package:enfluwence/widgets/header/auth_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(ASizes.lg),
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
                const SizedBox(
                  height: ASizes.spaceBtwSections,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                    ASizes.noOfOTP,
                    (index) => const OtpInput(),
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
                      child: Row(
                        children: [
                          Icon(
                            Icons.refresh,
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
                  ],
                ),
                const SizedBox(
                  height: ASizes.spaceBtwSections,
                ),
                const ACountDown(seconds: 20),
                PrimaryButton(
                    name: AText.tContinue,
                    onPressed: () {
                      Get.to(const SuccessScreen());
                    }),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
