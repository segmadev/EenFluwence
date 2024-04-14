import 'package:enfluwence/pages/auth/controllers/preview/preview_controller.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ASoomthPageIndicator extends StatelessWidget {
  ASoomthPageIndicator({
    super.key,
    required this.count,
  });

  final _controller = PreviewController.instance;
  final int count;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: const Alignment(0, 0.7),
      child: SmoothPageIndicator(
        controller: _controller.pageController,
        count: count,
        effect: const WormEffect(
          dotWidth: 5, // Adjust the size of the dots here
          dotHeight: 5, // Adjust the size of the dots here
        ),
      ),
    );
  }
}
