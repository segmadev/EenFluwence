import 'package:enfluwence/pages/influencers/screens/campaings/task_button.dart';
import 'package:enfluwence/pages/influencers/screens/wallet/balance.dart';
import 'package:enfluwence/utills/consts/icons.dart';
import 'package:enfluwence/utills/consts/size.dart';
import 'package:enfluwence/utills/helpers/helper_functions.dart';
import 'package:enfluwence/widgets/appbar/appbar.dart';
import 'package:enfluwence/widgets/buttons/lg_button.dart';
import 'package:enfluwence/widgets/containers/card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: ASizes.defaultSpace),
          child: Column(
            children: [
              SizedBox(height: ASizes.md),
              Container(
                // padding: EdgeInsets.symmetric(horizontal: ASizes.defaultSpace),
                width: AHelperFunctions.screenWidth(),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 100,
                      child: Text("March 27 2024"),
                    ),
                    Balance(
                      isSmall: true,
                    ),
                  ],
                ),
              ),
              const ACard(
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
