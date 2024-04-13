import 'package:enfluwence/utills/consts/colors.dart';
import 'package:enfluwence/utills/consts/size.dart';
import 'package:flutter/material.dart';

class ATextFormFieldTheme {
  ATextFormFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: AColor.gray,
    suffixIconColor: AColor.gray,
    // constraints: const BoxConstraints.expand(height: ASizes.inputFieldHeight),
    labelStyle: const TextStyle()
        .copyWith(fontSize: ASizes.fontSizeMd, color: AColor.black),
    hintStyle: const TextStyle()
        .copyWith(fontSize: ASizes.fontSizeSm, color: AColor.black),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle:
        const TextStyle().copyWith(color: AColor.black.withOpacity(0.8)),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(ASizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: AColor.transparent),
    ),

    fillColor: AColor.black.withOpacity(0.7),

    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(ASizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: AColor.gray),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(ASizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: AColor.black),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(ASizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: AColor.warning),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(ASizes.inputFieldRadius),
      borderSide: const BorderSide(width: 2, color: AColor.warning),
    ),
  );

  static InputDecorationTheme blackInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 2,
    prefixIconColor: AColor.gray,
    suffixIconColor: AColor.gray,
    // constraints: const BoxConstraints.expand(height: ASizes.inputFieldHeight),
    labelStyle: const TextStyle()
        .copyWith(fontSize: ASizes.fontSizeMd, color: AColor.white),
    hintStyle: const TextStyle()
        .copyWith(fontSize: ASizes.fontSizeSm, color: AColor.white),
    floatingLabelStyle:
        const TextStyle().copyWith(color: AColor.white.withOpacity(0.8)),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(ASizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: AColor.transparent),
    ),

    fillColor: AColor.white.withOpacity(0.7),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(ASizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: AColor.gray),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(ASizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: AColor.white),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(ASizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: AColor.warning),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(ASizes.inputFieldRadius),
      borderSide: const BorderSide(width: 2, color: AColor.warning),
    ),
  );
}
