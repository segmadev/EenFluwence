import 'package:enfluwence/utills/consts/colors.dart';
import 'package:enfluwence/utills/consts/size.dart';
import 'package:enfluwence/utills/consts/text.dart';
import 'package:enfluwence/widgets/buttons/round_button.dart';
import 'package:flutter/material.dart';

class FundAccountButton extends StatelessWidget {
  const FundAccountButton({super.key, this.backgroundColor, this.color});
  final Color? backgroundColor;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return RoundButton(
      color: backgroundColor ?? AColor.darkSuccess,
      width: double.infinity,
      child: Text(
        AText.fundAccount,
        style: TextStyle(
            color: color ?? AColor.white, fontSize: ASizes.fontSizeSm),
      ),
    );
  }
}
