import 'package:enfluwence/data/repositories/authentication/authentication_repository.dart';
import 'package:enfluwence/pages/auth/screens/auth.dart';
import 'package:enfluwence/pages/general/models/user.dart';
import 'package:enfluwence/pages/general/screens/profile/profile.dart';
import 'package:enfluwence/pages/influencers/screens/tasks/campaign/campaign_page.dart';
import 'package:enfluwence/pages/influencers/screens/home/home.dart';
import 'package:enfluwence/pages/influencers/screens/wallet/wallet_page.dart';
import 'package:enfluwence/pages/user/screens/home/user_home.dart';
import 'package:enfluwence/pages/user/screens/task/user_task.dart';
import 'package:enfluwence/pages/user/screens/wallet/user_wallet.dart';
import 'package:enfluwence/utills/consts/colors.dart';
import 'package:enfluwence/utills/consts/icons.dart';
import 'package:enfluwence/utills/consts/text.dart';
import 'package:enfluwence/widgets/navigation/back_navigation.dart';
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

  static List<dynamic> userNavigationList = [
    {"label": AText.home, "icon": AIcons.home, "screen": UHomeScreen()},
    {"label": AText.tasks, "icon": AIcons.tasks, "screen": UTaskScreen()},
    {"label": AText.wallet, "icon": AIcons.wallet, "screen": UWalletScreen()},
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
        child: ProfilePage(),
      )
    },
    {
      "label": AText.settings,
      "screen": const BackNavigation(
        body: Center(child: Text("Settings Page")),
      )
    },
    {
      "label": AText.support,
      "screen": const BackNavigation(
        body: Center(child: Text("Support Page")),
      )
    },
    {
      "label": AText.legal,
      "screen": const BackNavigation(
        body: Center(child: Text("Legal Page")),
      )
    },
    {
      "label": AText.about,
      "screen": const BackNavigation(
        body: Center(child: Text("About page")),
      )
    },
    {
      "label": AText.logOut,
      "color": AColor.danger.withOpacity(0.4),
      "icon": AIcons.logout,
      "screen": AuthScreen(),
      "function": () {
        AuthenticationRepository().logout();
      }
    },
  ];
}
