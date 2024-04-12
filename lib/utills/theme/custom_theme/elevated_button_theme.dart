import 'package:enfluwence/utills/consts/colors.dart';
import 'package:enfluwence/utills/consts/size.dart';
import 'package:flutter/material.dart';

/* -- Light & Dark Elevated Button Themes -- */
class AElevatedButtonTheme {
  AElevatedButtonTheme._(); //To avoid creating instances

  /* -- Light Theme -- */
  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: AColor.white,
      backgroundColor: AColor.lprimary,
      // disabledForegroundColor: AColor.darkGrey,
      // disabledBackgroundColor: AColor.lprimary,
      // side: const BorderSide(color: AColor.lprimary),
      padding: const EdgeInsets.symmetric(vertical: ASizes.buttonHeight),
      textStyle: const TextStyle(
          fontSize: 16, color: AColor.white, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(ASizes.buttonRadius)),
    ),
  );

  /* -- Dark Theme -- */
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: AColor.black,
      backgroundColor: AColor.dprimary,
      // disabledForegroundColor: AColor.darkGrey,
      // disabledBackgroundColor: AColor.dprimary,
      // side: const BorderSide(color: AColor.dprimary),
      padding: const EdgeInsets.symmetric(vertical: ASizes.buttonHeight),
      textStyle: const TextStyle(
          fontSize: 16, color: AColor.white, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(ASizes.buttonRadius)),
    ),
  );
}
