import 'package:enfluwence/pages/auth/controllers/preview/preview_controller.dart';
import 'package:enfluwence/pages/auth/screen/auth.dart';
import 'package:enfluwence/utills/consts/size.dart';
import 'package:enfluwence/utills/consts/text.dart';
import 'package:enfluwence/widgets/buttons/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SinglePage extends StatelessWidget {
  SinglePage({
    super.key,
    required this.imageUrl,
    this.title,
    required this.description,
  });

  final String imageUrl;
  final String? title;
  final String description;
  final _controller = PreviewController.instance;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      color: Colors.transparent,
      child: Column(
        children: [
          const SizedBox(
            height: ASizes.imageCarouselHeight,
          ),
          Image.asset(imageUrl),
          const SizedBox(
            height: 60,
          ),
          Text(
            title ?? "",
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          SizedBox(
            width: 300,
            height: (screenHeight / 2) - 50,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  description,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(
                  height: 10,
                ),
                PrimaryButton(
                  name: AText.next,
                  onPressed: () {
                    // Get.to(const AuthScreen());
                    _controller.nextPage(context);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
