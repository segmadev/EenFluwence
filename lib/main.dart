import 'package:enfluwence/pages/auth/screen/auth.dart';
import 'package:enfluwence/pages/auth/screen/signIn/signin.dart';
import 'package:enfluwence/utills/theme/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // themeMode: ThemeMode.system,
      theme: AAppTheme.lightTheme,
      darkTheme: AAppTheme.darkTheme,
      home: const Scaffold(body: AuthScreen()
          // APagePreview()
          ),
    );
  }
}
