import 'package:enfluwence/utills/consts/colors.dart';
import 'package:enfluwence/utills/consts/size.dart';
import 'package:enfluwence/utills/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  const RoundButton({
    super.key,
    this.name = "submit",
    this.onPressed,
    this.color,
    this.child,
    this.width,
    this.height,
  });
  final String name;
  final void Function()? onPressed;
  final Color? color;
  final Widget? child;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    final isDark = AHelperFunctions.isDarkMode(context);
    return SizedBox(
        width: width ?? ASizes.buttonWidth,
        height: height ?? null,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            foregroundColor: color != null
                ? color?.withOpacity(0.7)
                : Theme.of(context).primaryColor.withOpacity(0.7),
            backgroundColor:
                color ?? (isDark ? AColor.dprimary : AColor.lprimary),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
          ),
          onPressed: onPressed ?? () {},
          child: Center(
            child: child != null
                ? child
                : Text(name,
                    style: TextStyle(
                        color: AHelperFunctions.isDarkMode(context)
                            ? AColor.black
                            : AColor.white)),
          ),
        ));
  }
}
