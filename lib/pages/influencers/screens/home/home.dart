import 'package:enfluwence/pages/influencers/screens/campaings/task_button.dart';
import 'package:enfluwence/pages/influencers/screens/home/home_header.dart';
import 'package:enfluwence/utills/consts/size.dart';
import 'package:enfluwence/widgets/containers/card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: ASizes.defaultSpace),
          child: Column(
            children: [
              SizedBox(height: ASizes.md),
              HomeHeader(),
              ACard(
                child: Column(children: [
                  TaskButton(),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
