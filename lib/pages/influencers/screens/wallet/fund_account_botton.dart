import 'package:enfluwence/utills/consts/colors.dart';
import 'package:enfluwence/utills/consts/size.dart';
import 'package:enfluwence/utills/consts/text.dart';
import 'package:enfluwence/widgets/buttons/round_button.dart';
import 'package:flutter/material.dart';

class FundAccountButton extends StatelessWidget {
  const FundAccountButton({super.key});

  @override
  Widget build(BuildContext context) {
    return const RoundButton(
      color: AColor.darkSuccess,
      child: Text(
        AText.fundAccount,
        style:
            TextStyle(color: AColor.lightSuccess, fontSize: ASizes.fontSizeSm),
      ),
    );
  }
}
