import 'package:enfluwence/utills/consts/colors.dart';
import 'package:enfluwence/utills/consts/size.dart';
import 'package:enfluwence/utills/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:timer_count_down/timer_count_down.dart';

class ACountDown extends StatelessWidget {
  const ACountDown({super.key, this.seconds});
  final int? seconds;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(ASizes.sm),
          color: AHelperFunctions.isDarkMode(context)
              ? AColor.white.withOpacity(0.4)
              : AColor.black.withOpacity(0.4),
          child: Center(
            child: Countdown(
              seconds: seconds ?? 60,
              build: (BuildContext context, double time) => Text(
                  time.toString(),
                  style: Theme.of(context).textTheme.bodySmall),
              interval: Duration(milliseconds: 100),
              onFinished: () {
                //  do something here
              },
            ),
          ),
        ),
        SizedBox(height: ASizes.sm),
      ],
    );
  }
}
