import 'package:enfluwence/pages/influencers/screens/home.dart';
import 'package:enfluwence/utills/consts/icons.dart';
import 'package:enfluwence/utills/consts/text.dart';
import 'package:flutter/material.dart';

class ANavigationList {
  static List<dynamic> navigationList = [
    {
      "label": AText.home,
      "icon": AIcons.home,
      "screen": const Center(
        child: HomeScreen(),
      )
    },
    {
      "label": AText.campaigns,
      "icon": AIcons.campaigns,
      "screen": const Center(
        child: Text("Campaigns page"),
      )
    },
    {
      "label": AText.wallet,
      "icon": AIcons.wallet,
      "screen": const Center(
        child: Text("Wallet page"),
      )
    },
    {
      "label": AText.more,
      "icon": AIcons.widget,
      "screen": const Center(
        child: Text("More page"),
      )
    },
  ];
}
