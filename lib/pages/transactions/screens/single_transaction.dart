import 'package:enfluwence/utills/consts/size.dart';
import 'package:enfluwence/utills/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class SingleTransaction extends StatelessWidget {
  const SingleTransaction({super.key, this.trans});
  final dynamic trans;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // trans name and amount
            SizedBox(
              child: Row(children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(trans['icon']),
                  backgroundColor: Colors.grey.withOpacity(0.3),
                ),
                SizedBox(width: ASizes.spaceBtwItems),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(trans['title']),
                    Text(AHelperFunctions.fomartDate(trans['date']),
                        style: Theme.of(context).textTheme.bodySmall),
                  ],
                ),
              ]),
            ),
            // amount
            AHelperFunctions.moneyFormart(trans['amount'], trans['type']),
          ],
        ),
        SizedBox(height: ASizes.spaceBtwItems),
      ],
    );
  }
}
