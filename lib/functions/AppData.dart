import 'dart:convert';

import 'package:enfluwence/utills/consts/asset_paths.dart';
import 'package:flutter/services.dart';

class AppData {
  Future<void> loadJsonData() async {
    String data = await rootBundle.loadString(AAssets.splashUrl);
    return json.decode(data);
  }
}
