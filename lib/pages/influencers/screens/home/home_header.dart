import 'package:enfluwence/pages/influencers/screens/wallet/balance.dart';
import 'package:enfluwence/utills/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    var timestamp = DateFormat('d MMMM y').format(DateTime.now());
    return SizedBox(
      // padding: EdgeInsets.symmetric(horizontal: ASizes.defaultSpace),
      width: AHelperFunctions.screenWidth(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 100,
            child: Text(timestamp.toString()),
          ),
          Balance(
            isSmall: true,
          ),
        ],
      ),
    );
  }
}
