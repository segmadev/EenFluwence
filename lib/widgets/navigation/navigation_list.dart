import 'package:enfluwence/utills/consts/icons.dart';
import 'package:flutter/material.dart';

class ANavigationList {
  static List<dynamic> navigationList = [
    {
      "label": "Home",
      "icon": AIcons.home,
      "screen": const Center(
        child: Text("Home page"),
      )
    },
    {
      "label": "Campaigns",
      "icon": AIcons.campaigns,
      "screen": const Center(
        child: Text("Campaigns page"),
      )
    },
    {
      "label": "Wallet",
      "icon": AIcons.wallet,
      "screen": const Center(
        child: Text("Wallet page"),
      )
    },
    {
      "label": "More",
      "icon": AIcons.widget,
      "screen": const Center(
        child: Text("More page"),
      )
    },
  ];
}
