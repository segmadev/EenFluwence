import 'package:enfluwence/utills/consts/colors.dart';
import 'package:enfluwence/utills/consts/icons.dart';
import 'package:enfluwence/utills/consts/size.dart';
import 'package:enfluwence/utills/consts/text.dart';
import 'package:enfluwence/utills/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AAppBar(
      {super.key,
      this.title,
      this.showBackArrow = true,
      this.leading,
      this.actions,
      this.leadingOnPressed,
      this.leadingWidth = 60});
  final Widget? title;
  final bool showBackArrow;
  final Widget? leading;
  final List<Widget>? actions;
  final VoidCallback? leadingOnPressed;
  final double leadingWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AColor.appBarBg,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: ASizes.lg),
        child: AppBar(
            titleSpacing: ASizes.sm,
            automaticallyImplyLeading: false,
            title: showBackArrow ? const Text(AText.back) : title,
            leadingWidth: showBackArrow ? 30 : leadingWidth,
            leading: showBackArrow
                ? TextButton(
                    style: TextButton.styleFrom(
                        padding: EdgeInsets.zero, alignment: Alignment.center),
                    onPressed: () => Get.back(),
                    child: const Icon(
                      AIcons.back,
                      size: ASizes.iconSm,
                    ))
                : leading,
            actions: actions),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(ADeviceUtils.getAppBarHeight());
}
