import 'package:enfluwence/pages/general/models/user.dart';
import 'package:enfluwence/utills/consts/asset_paths.dart';
import 'package:flutter/material.dart';

class AProfile {
  static Widget profileAvatar = CircleAvatar(
    backgroundImage: getProfileUrl(),
    backgroundColor: Colors.transparent,
  );

  static Widget display_profile({avatar}) {
    avatar = (avatar != null && avatar != "")
        ? NetworkImage(avatar)
        : const AssetImage(AAssets.defaultProfile);
    return CircleAvatar(
      backgroundImage: avatar,
      backgroundColor: Colors.transparent,
    );
  }

  static dynamic getProfileUrl() {
    if (User.user.avatar != null && User.user.avatar != "") {
      return NetworkImage(User.user.avatar);
    }

    // if (User.info['gender'] != null && User.info['gender'] != "female") {
    //   return const AssetImage(AAssets.defaultProfileFemale);
    // }
    // if (User.info['gender'] != null && User.info['gender'] != "male") {
    //   return const AssetImage(AAssets.defaultProfileMale);
    // }

    return const AssetImage(AAssets.defaultProfile);
  }
}
