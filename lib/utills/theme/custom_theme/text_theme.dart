import 'package:enfluwence/utills/consts/colors.dart';
import 'package:flutter/material.dart';

/// Custom Class for white & black Text Themes
class ATextTheme {
  ATextTheme._(); // To avoid creating instances

  /// Customizable white Text Theme
  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(
        fontSize: 32.0, fontWeight: FontWeight.bold, color: AColor.black),
    headlineMedium: const TextStyle().copyWith(
        fontSize: 24.0, fontWeight: FontWeight.w600, color: AColor.black),
    headlineSmall: const TextStyle().copyWith(
        fontSize: 18.0, fontWeight: FontWeight.w600, color: AColor.black),
    titleLarge: const TextStyle().copyWith(
        fontSize: 16.0, fontWeight: FontWeight.w600, color: AColor.black),
    titleMedium: const TextStyle().copyWith(
        fontSize: 16.0, fontWeight: FontWeight.w500, color: AColor.black),
    titleSmall: const TextStyle().copyWith(
        fontSize: 16.0, fontWeight: FontWeight.w400, color: AColor.black),
    bodyLarge: const TextStyle().copyWith(
        fontSize: 14.0, fontWeight: FontWeight.w500, color: AColor.black),
    bodyMedium: const TextStyle().copyWith(
        fontSize: 14.0, fontWeight: FontWeight.normal, color: AColor.black),
    bodySmall: const TextStyle().copyWith(
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
        color: AColor.black.withOpacity(0.5)),
    labelLarge: const TextStyle().copyWith(
        fontSize: 12.0, fontWeight: FontWeight.normal, color: AColor.black),
    labelMedium: const TextStyle().copyWith(
        fontSize: 12.0,
        fontWeight: FontWeight.normal,
        color: AColor.black.withOpacity(0.5)),
  );

  /// Customizable black Text Theme
  static TextTheme darkTextTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(
        fontSize: 32.0, fontWeight: FontWeight.bold, color: AColor.white),
    headlineMedium: const TextStyle().copyWith(
        fontSize: 24.0, fontWeight: FontWeight.w600, color: AColor.white),
    headlineSmall: const TextStyle().copyWith(
        fontSize: 18.0, fontWeight: FontWeight.w600, color: AColor.white),
    titleLarge: const TextStyle().copyWith(
        fontSize: 16.0, fontWeight: FontWeight.w600, color: AColor.white),
    titleMedium: const TextStyle().copyWith(
        fontSize: 16.0, fontWeight: FontWeight.w500, color: AColor.white),
    titleSmall: const TextStyle().copyWith(
        fontSize: 16.0, fontWeight: FontWeight.w400, color: AColor.white),
    bodyLarge: const TextStyle().copyWith(
        fontSize: 14.0, fontWeight: FontWeight.w500, color: AColor.white),
    bodyMedium: const TextStyle().copyWith(
        fontSize: 14.0, fontWeight: FontWeight.normal, color: AColor.white),
    bodySmall: const TextStyle().copyWith(
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
        color: AColor.white.withOpacity(0.5)),
    labelLarge: const TextStyle().copyWith(
        fontSize: 12.0, fontWeight: FontWeight.normal, color: AColor.white),
    labelMedium: const TextStyle().copyWith(
        fontSize: 12.0,
        fontWeight: FontWeight.normal,
        color: AColor.white.withOpacity(0.5)),
  );
}
