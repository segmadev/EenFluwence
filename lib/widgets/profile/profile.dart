import 'package:enfluwence/pages/influencers/models/user.dart';
import 'package:enfluwence/utills/consts/asset_paths.dart';
import 'package:flutter/material.dart';

class AProfile {
  static Widget profileAvatar = CircleAvatar(
    backgroundImage: getProfileUrl(),
    backgroundColor: Colors.transparent,
  );

  static dynamic getProfileUrl() {
    if (User.info['profile'] != null && User.info['profile'] != "") {
      return NetworkImage(User.info['profile']!);
    }

    if (User.info['gender'] != null && User.info['gender'] != "female") {
      return const AssetImage(AAssets.defaultProfileFemale);
    }
    if (User.info['gender'] != null && User.info['gender'] != "male") {
      return const AssetImage(AAssets.defaultProfileMale);
    }

    return const AssetImage(AAssets.defaultProfile);
  }
}
