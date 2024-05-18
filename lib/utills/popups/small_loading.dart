import 'package:enfluwence/utills/consts/colors.dart';
import 'package:enfluwence/utills/helpers/helper_functions.dart';
import 'package:enfluwence/widgets/containers/card.dart';
import 'package:flutter/material.dart';

class SmallLoading extends StatelessWidget {
  const SmallLoading({super.key});

  @override
  Widget build(BuildContext context) {
    var isDark = AHelperFunctions.isDarkMode(context);
    return Center(
      child: ACard(
        width: 60.0,
        height: 60.0,
        child: CircularProgressIndicator(
          color: isDark ? AColor.white : AColor.black,
        ),
      ),
    );
  }
}
