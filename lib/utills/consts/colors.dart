import 'package:flutter/material.dart';

class AColor {
  // Color gradinetColor = Color.fromRGBO(58, 44, 252, 0.604);
  static LinearGradient gradinetColor = const LinearGradient(
    colors: [Color(0xff5634ff), Color(0xff766aff), Color(0xff8082ff)],
    stops: [0, 0.5, 1],
    begin: Alignment(0.1, 0.1),
    end: Alignment(-1.0, -0.2),
  );
// app bar bg
  static const appBarBg = Color.fromARGB(255, 10, 10, 15);
// dbackground
  static const dbackground = Color(0xff1A1A27);
// lbackground
  static const lbackground = Color.fromARGB(255, 229, 229, 229);
  // scolor
  static const scolor = Color(0xff4318FF);
// dprimary
  static const dprimary = Color(0xffF0F0F0);
// lprimary
  static const lprimary = Color(0xff161B25);
// success
  static const lightSuccess = Color(0xff86FF8B);
  static const darkSuccess = Color(0xff02B70A);
// danger
  static const danger = Color(0xffEE5D50);
// warning
  static const warning = Color(0xffFFF6A4);
// white
  static const white = Color(0xffffffff);
// black
  static const black = Color.fromARGB(255, 10, 10, 10);
// transparent
  static const transparent = Color(0x00000000);
// gradientColor
// blue
  static const blue = Color(0xff4318FF);
// gray
  static const gray = Color(0xFF4F4F4F);
}
