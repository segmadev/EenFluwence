import 'package:enfluwence/pages/influencers/screens/tasks/campaign/campaign_page.dart';
import 'package:enfluwence/pages/influencers/screens/home/home.dart';
import 'package:enfluwence/pages/influencers/screens/wallet/wallet_page.dart';
import 'package:enfluwence/utills/consts/colors.dart';
import 'package:enfluwence/utills/consts/icons.dart';
import 'package:enfluwence/utills/consts/text.dart';
import 'package:enfluwence/widgets/navigation/more_navigation_menu.dart';
import 'package:flutter/material.dart';

class ANavigationList {
  static List<dynamic> navigationList = [
    {"label": AText.home, "icon": AIcons.home, "screen": HomeScreen()},
    {
      "label": AText.campaigns,
      "icon": AIcons.campaigns,
      "screen": CampaignScreen()
    },
    {"label": AText.wallet, "icon": AIcons.wallet, "screen": WalletScreen()},
    {
      "label": AText.more,
      "icon": AIcons.widget,
      "screen": MoreNavigationMenu()
    },
  ];

  static List<dynamic> moreNavigationList = [
    {
      "label": AText.profile,
      "screen": const Center(
        child: HomeScreen(),
      )
    },
    {
      "label": AText.settings,
      "screen": const Center(
        child: CampaignScreen(),
      )
    },
    {
      "label": AText.support,
      "screen": const Center(
        child: WalletScreen(),
      )
    },
    {
      "label": AText.legal,
      "screen": const Center(
        child: Text("More page"),
      )
    },
    {
      "label": AText.about,
      "screen": const Center(
        child: Text("More page"),
      )
    },
    {
      "label": AText.legal,
      "screen": const Center(
        child: Text("More page"),
      )
    },
    {
      "label": AText.logOut,
      "color": AColor.danger.withOpacity(0.4),
      "icon": AIcons.logout,
      "screen": const Center(
        child: Text("More page"),
      )
    },
  ];
}
