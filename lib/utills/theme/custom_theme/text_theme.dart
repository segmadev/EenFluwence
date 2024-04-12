import 'package:enfluwence/utills/consts/colors.dart';
import 'package:enfluwence/utills/consts/size.dart';
import 'package:flutter/material.dart';

class ATextTheme {
  ATextTheme._();
  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(
        fontSize: ASizes.fontSizeLg,
        fontWeight: FontWeight.bold,
        color: AColor.black),
    headlineMedium: const TextStyle().copyWith(
        fontSize: ASizes.fontSizeMd,
        fontWeight: FontWeight.w600,
        color: AColor.black),
    headlineSmall: const TextStyle().copyWith(color: AColor.black),

    // body style
    bodyLarge: const TextStyle().copyWith(
        fontSize: ASizes.fontSizeSm,
        fontWeight: FontWeight.w400,
        color: AColor.black),
    bodyMedium: const TextStyle().copyWith(
        fontSize: ASizes.fontSizeSm,
        fontWeight: FontWeight.w400,
        color: AColor.black),
    bodySmall: const TextStyle().copyWith(color: AColor.black),

    // text style
    titleLarge: const TextStyle().copyWith(
        fontSize: ASizes.fontSizeMd,
        fontWeight: FontWeight.w600,
        color: AColor.black),
    titleMedium: const TextStyle().copyWith(
        fontSize: ASizes.fontSizeMd,
        fontWeight: FontWeight.w500,
        color: AColor.black),
    titleSmall: const TextStyle().copyWith(
        fontSize: ASizes.fontSizeMd,
        fontWeight: FontWeight.w400,
        color: AColor.black),

    // lable style
    labelLarge: const TextStyle().copyWith(
        fontSize: ASizes.fontSizeSm,
        fontWeight: FontWeight.normal,
        color: AColor.black),
    labelMedium: const TextStyle().copyWith(
        fontSize: ASizes.fontSizeSm,
        fontWeight: FontWeight.normal,
        color: AColor.black),
    labelSmall: const TextStyle().copyWith(
        fontSize: ASizes.fontSizeSm,
        fontWeight: FontWeight.normal,
        color: AColor.black),
  );

// dark theme start here ---------------------------------------------------
  static TextTheme darkTextTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(
        fontSize: ASizes.fontSizeLg,
        fontWeight: FontWeight.bold,
        color: AColor.white),
    headlineMedium: const TextStyle().copyWith(
        fontSize: ASizes.fontSizeMd,
        fontWeight: FontWeight.w600,
        color: AColor.white),
    headlineSmall: const TextStyle().copyWith(color: AColor.white),

    // body style
    bodyLarge: const TextStyle().copyWith(
        fontSize: ASizes.fontSizeLg,
        fontWeight: FontWeight.w400,
        color: AColor.white),
    bodyMedium: const TextStyle().copyWith(
        fontSize: ASizes.fontSizeMd,
        fontWeight: FontWeight.w400,
        color: AColor.white),
    bodySmall: const TextStyle().copyWith(color: AColor.white),

    // text style
    titleLarge: const TextStyle().copyWith(
        fontSize: ASizes.fontSizeMd,
        fontWeight: FontWeight.w600,
        color: AColor.white),
    titleMedium: const TextStyle().copyWith(
        fontSize: ASizes.fontSizeMd,
        fontWeight: FontWeight.w500,
        color: AColor.white),
    titleSmall: const TextStyle().copyWith(
        fontSize: ASizes.fontSizeMd,
        fontWeight: FontWeight.w400,
        color: AColor.white),

    // lable style
    labelLarge: const TextStyle().copyWith(
        fontSize: ASizes.fontSizeSm,
        fontWeight: FontWeight.normal,
        color: AColor.white),
    labelMedium: const TextStyle().copyWith(
        fontSize: ASizes.fontSizeSm,
        fontWeight: FontWeight.normal,
        color: AColor.white),
    labelSmall: const TextStyle().copyWith(
        fontSize: ASizes.fontSizeSm,
        fontWeight: FontWeight.normal,
        color: AColor.white),
  );
}
