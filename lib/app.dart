import 'package:enfluwence/bindings/general_bindings.dart';
import 'package:enfluwence/pages/auth/screens/preview/page_preview.dart';
import 'package:enfluwence/utills/consts/colors.dart';
import 'package:enfluwence/utills/helpers/helper_functions.dart';
import 'package:enfluwence/utills/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// void main() {
//   runApp(const MainApp());
// }

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    var isDark = AHelperFunctions.isDarkMode(context);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      // themeMode: ThemeMode.light,
      theme: AAppTheme.lightTheme,
      darkTheme: AAppTheme.darkTheme,
      initialBinding: GeneralBindings(),
      home: Scaffold(
          // body: APagePreview()
          body: Center(
              child: CircularProgressIndicator(
        color: isDark ? AColor.white : AColor.black,
      ))),
    );
  }
}

// backup using go_router
// class MainApp extends StatelessWidget {
//   const MainApp({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp.router(
//       routeInformationColor.fromARGB(255, 190, 149, 0)InformationProvider,
//       debugShowCheckedModeBanner: false,
//       themeMode: ThemeMode.system,
//       theme: AAppTheme.lightTheme,
//       darkTheme: AAppTheme.darkTheme,
//       routeInformationParser: ARouter().router.routeInformationParser,
//       routerDelegate: ARouter().router.routerDelegate,
//     );
//   }
// }