import 'dart:math';

import 'package:enfluwence/utills/consts/asset_paths.dart';
import 'package:enfluwence/utills/consts/colors.dart';
import 'package:enfluwence/utills/consts/config.dart';
import 'package:enfluwence/utills/consts/size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AHelperFunctions {
  static Color? getColor(String value) {
    /// Define your product specific colors here and it will match the attribute colors and show specific 🟠🟡🟢🔵🟣🟤

    if (value == 'Green') {
      return Colors.green;
    } else if (value == 'Green') {
      return Colors.green;
    } else if (value == 'Red') {
      return Colors.red;
    } else if (value == 'Blue') {
      return Colors.blue;
    } else if (value == 'Pink') {
      return Colors.pink;
    } else if (value == 'Grey') {
      return Colors.grey;
    } else if (value == 'Purple') {
      return Colors.purple;
    } else if (value == 'Black') {
      return Colors.black;
    } else if (value == 'White') {
      return Colors.white;
    } else if (value == 'Yellow') {
      return Colors.yellow;
    } else if (value == 'Orange') {
      return Colors.deepOrange;
    } else if (value == 'Brown') {
      return Colors.brown;
    } else if (value == 'Teal') {
      return Colors.teal;
    } else if (value == 'Indigo') {
      return Colors.indigo;
    } else {
      return null;
    }
  }

  static void showSnackBar(String message) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  static int getRondomNums() {
    final Random random = Random();
    return 1000 + random.nextInt(9000);
  }

  static Color getCardBackgroundColor(context) {
    var isDark = AHelperFunctions.isDarkMode(context);
    return isDark ? AColor.black.withOpacity(0.3) : AColor.white;
  }

  T getRandomElement<T>(List<T> list) {
    final random = new Random();
    var i = random.nextInt(list.length);
    return list[i];
  }

  static void showAlert(String title, String message) {
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  static void navigateToScreen(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => screen),
    );
  }

  static String truncateText(String text, int maxLength) {
    if (text.length <= maxLength) {
      return text;
    } else {
      return '${text.substring(0, maxLength)}...';
    }
  }

  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  static String getLogoUrl(BuildContext context) {
    return AHelperFunctions.isDarkMode(context)
        ? AAssets.lightAppLogo
        : AAssets.darkAppLogo;
  }

  static Size screenSize() {
    return MediaQuery.of(Get.context!).size;
  }

  static double screenHeight() {
    return MediaQuery.of(Get.context!).size.height;
  }

  static double screenWidth() {
    return MediaQuery.of(Get.context!).size.width;
  }

  static String getFormattedDate(DateTime date,
      {String format = 'dd MMM yyyy'}) {
    return DateFormat(format).format(date);
  }

  static List<T> removeDuplicates<T>(List<T> list) {
    return list.toSet().toList();
  }

  static List<Widget> wrapWidgets(List<Widget> widgets, int rowSize) {
    final wrappedList = <Widget>[];
    for (var i = 0; i < widgets.length; i += rowSize) {
      final rowChildren = widgets.sublist(
          i, i + rowSize > widgets.length ? widgets.length : i + rowSize);
      wrappedList.add(Row(children: rowChildren));
    }
    return wrappedList;
  }

  static String fomartDate(int timestamp) {
    DateTime now = DateTime.now();
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(
        timestamp.toString().length <= 12 ? timestamp * 1000 : timestamp);

    return dateTime.year == now.year &&
            dateTime.month == now.month &&
            dateTime.day == now.day
        ? 'Today, ${DateFormat.Hm().format(dateTime)}'
        : DateFormat('yyyy-MM-dd HH:mm').format(dateTime);
  }

  static dynamic moneyFormart(num amount,
      {dynamic type = null, bool withColor = true}) {
    var fAmount =
        NumberFormat.currency(locale: AConfig.locale, symbol: AConfig.symbol)
            .format(amount);
    fAmount = fAmount.endsWith('.00')
        ? fAmount.substring(0, fAmount.length - 3)
        : fAmount;
    fAmount = type != null
        ? type == "debit"
            ? "-$fAmount"
            : "+$fAmount"
        : fAmount;
    return !withColor
        ? fAmount
        : Text(
            fAmount,
            style: TextStyle(
              color: type == "debit" ? AColor.danger : AColor.lightSuccess,
              fontSize: ASizes.fontSizeMd,
            ),
          );
  }
}
