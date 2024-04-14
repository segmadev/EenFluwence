import 'package:enfluwence/pages/auth/screen/auth.dart';
import 'package:enfluwence/pages/auth/screen/preview/page_preview.dart';
import 'package:enfluwence/pages/auth/screen/signIn/signin.dart';
import 'package:enfluwence/utills/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // themeMode: ThemeMode.system,
      theme: AAppTheme.lightTheme,
      darkTheme: AAppTheme.darkTheme,
      home: const Scaffold(body: APagePreview()),
    );
  }
}

// backup using go_router
// class MainApp extends StatelessWidget {
//   const MainApp({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp.router(
//       routeInformationProvider: ARouter().router.routeInformationProvider,
//       debugShowCheckedModeBanner: false,
//       themeMode: ThemeMode.system,
//       theme: AAppTheme.lightTheme,
//       darkTheme: AAppTheme.darkTheme,
//       routeInformationParser: ARouter().router.routeInformationParser,
//       routerDelegate: ARouter().router.routerDelegate,
//     );
//   }
// }
