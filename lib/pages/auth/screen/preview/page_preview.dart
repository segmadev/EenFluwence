import 'dart:convert';
import 'package:enfluwence/pages/auth/controllers/preview/preview_controller.dart';
import 'package:enfluwence/utills/consts/asset_paths.dart';
import 'package:enfluwence/utills/consts/size.dart';
import 'package:enfluwence/utills/helpers/helper_functions.dart';
import 'package:enfluwence/pages/auth/screen/preview/single_page.dart';
import 'package:enfluwence/pages/auth/screen/preview/soomth_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class APagePreview extends StatefulWidget {
  const APagePreview({super.key});

  @override
  State<APagePreview> createState() => _APagePreviewState();
}

class _APagePreviewState extends State<APagePreview> {
  final _controller = Get.put(PreviewController());
  List<dynamic> splashList = [];

  Future<void> _getSplashList() async {
    String data = await rootBundle.loadString(AAssets.splashUrl);
    setState(() async {
      splashList = json.decode(data);
    });
  }

  @override
  void initState() {
    super.initState();
    _getSplashList();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = AHelperFunctions.isDarkMode(context);
    final cLogo = isDark ? AAssets.lightAppLogo : AAssets.darkAppLogo;
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Stack(
        children: <Widget>[
          PageView(
            controller: _controller.pageController,
            onPageChanged: _controller.onPageChanged,
            children: splashList.map((splash) {
              return SinglePage(
                imageUrl: cLogo,
                title: splash['title'] ?? "",
                description: splash['description'] ?? "",
              );
            }).toList(),
          ),
          // skip btn
          Positioned(
              top: kToolbarHeight,
              right: ASizes.defaultSpace,
              child: TextButton(
                onPressed: () {
                  _controller.skipToLastPage();
                },
                child: Text(
                  'Skip',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              )),

          ASoomthPageIndicator(count: splashList.length),
        ],
      ),
    );
  }
}
