import 'package:enfluwence/pages/influencers/screens/wallet/balance.dart';
import 'package:enfluwence/utills/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // padding: EdgeInsets.symmetric(horizontal: ASizes.defaultSpace),
      width: AHelperFunctions.screenWidth(),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 100,
            child: Text("March 27 2024"),
          ),
          Balance(
            isSmall: true,
          ),
        ],
      ),
    );
  }
}
