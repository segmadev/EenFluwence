import 'package:enfluwence/pages/auth/screen/signIn/signin.dart';
import 'package:enfluwence/pages/auth/screen/signUp/signup.dart';
import 'package:enfluwence/utills/consts/text.dart';
import 'package:enfluwence/widgets/controllers/simple_tabs_controller.dart';
import 'package:enfluwence/widgets/header/auth_header.dart';
import 'package:enfluwence/widgets/tabs/simple_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  const AuthHeader(),
                  SizedBox(
                    height: 80,
                    child: SimpleTab(
                      controller: _tabController,
                      tabs: const [
                        Tab(text: AText.signin),
                        Tab(text: AText.signup),
                      ],
                    ),
                  ),
                  Container(
                    height: 400,
                    padding: const EdgeInsets.all(20),
                    child:
                        TabBarView(controller: _tabController, children: const [
                      SignInScreen(),
                      SignUpScreen(),
                    ]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
