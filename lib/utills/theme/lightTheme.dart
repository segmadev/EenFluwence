// ignore_for_file: file_names
import 'package:enfluwence/utills/consts/colors.dart';
import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  fontFamily: 'Poppins',
  primaryColor: ThemeData.light().scaffoldBackgroundColor,
  appBarTheme: AppBarTheme(
    color: lightColor,
    iconTheme: IconThemeData(
      color: blackColor,
    ),
    systemOverlayStyle: systemUi,
  ),
  iconTheme: IconThemeData(
    color: blackColor,
  ),
  colorScheme: const ColorScheme.light().copyWith(
    primary: mainColor,
    secondary: secColor,
    background: whiteColor,
    secondaryContainer: lightColor,
  ),
);
