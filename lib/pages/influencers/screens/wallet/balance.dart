import 'package:enfluwence/utills/consts/colors.dart';
import 'package:enfluwence/utills/consts/icons.dart';
import 'package:enfluwence/utills/consts/size.dart';
import 'package:flutter/material.dart';

class Balance extends StatelessWidget {
  const Balance({super.key, this.isSmall = false});
  final bool isSmall;
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: AColor.blue,
      width: !isSmall ? double.infinity : ASizes.balanceBoxSmallHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: AColor.gradinetColor,
      ),
      child: Padding(
        padding: EdgeInsets.all(!isSmall ? ASizes.lg : ASizes.md),
        child: Row(
          verticalDirection: VerticalDirection.up,
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              textDirection: TextDirection.ltr,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Available Balance",
                    style: TextStyle(
                      color: AColor.white,
                    )),
                Text(
                  "N250,215",
                  style: TextStyle().copyWith(
                    color: AColor.white,
                    fontSize: !isSmall ? ASizes.fontSizeLg : ASizes.fontSizeMd,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
            IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                color: AColor.white,
                onPressed: () {},
                icon: Icon(AIcons.more_horiz))
          ],
        ),
      ),
    );
  }
}
