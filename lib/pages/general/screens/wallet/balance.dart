import 'package:enfluwence/pages/general/controllers/general_user.dart';
import 'package:enfluwence/pages/general/models/user.dart';
import 'package:enfluwence/utills/consts/colors.dart';
import 'package:enfluwence/utills/consts/icons.dart';
import 'package:enfluwence/utills/consts/size.dart';
import 'package:enfluwence/utills/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Balance extends StatefulWidget {
  const Balance({super.key, this.isSmall = false});
  final bool isSmall;

  @override
  State<Balance> createState() => _BalanceState();
}

class _BalanceState extends State<Balance> {
  final generalUserController = GeneralUserController.instance;
  @override
  Widget build(BuildContext context) {
    // print(balance.toString());
    return Container(
      // color: AColor.blue,
      width: !widget.isSmall ? double.infinity : ASizes.balanceBoxSmallHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: AColor.gradinetColor,
      ),
      child: Padding(
        padding: EdgeInsets.all(!widget.isSmall ? ASizes.lg : ASizes.md),
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
                Obx(() => Text(
                      AHelperFunctions.moneyFormart(
                          generalUserController.balance,
                          withColor: false),
                      style: TextStyle().copyWith(
                        color: AColor.white,
                        fontSize: !widget.isSmall
                            ? ASizes.fontSizeLg
                            : ASizes.fontSizeMd,
                        fontWeight: FontWeight.w500,
                      ),
                    ))
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
