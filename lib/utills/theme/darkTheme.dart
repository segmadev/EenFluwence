// ignore_for_file: file_names
import 'package:enfluwence/utills/consts/colors.dart';
import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
  fontFamily: 'Poppins',
  primaryColor: ThemeData.dark().scaffoldBackgroundColor,
  appBarTheme: AppBarTheme(
    color: blackColor,
    iconTheme: IconThemeData(
      color: whiteColor,
    ),
    systemOverlayStyle: systemUi,
  ),
  iconTheme: IconThemeData(
    color: whiteColor,
  ),
  colorScheme: const ColorScheme.dark().copyWith(
    primary: mainColor,
    secondary: secColor,
    background: ThemeData.dark().scaffoldBackgroundColor,
    secondaryContainer: grayDarkColor,
  ),
);
