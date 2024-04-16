import 'package:enfluwence/pages/influencers/screens/campaings/task_button.dart';
import 'package:enfluwence/pages/influencers/screens/home/home_header.dart';
import 'package:enfluwence/pages/influencers/screens/home/totals.dart';
import 'package:enfluwence/pages/influencers/screens/wallet/fund_account_botton.dart';
import 'package:enfluwence/pages/transactions/screens/transactions_list.dart';
import 'package:enfluwence/utills/consts/size.dart';
import 'package:enfluwence/widgets/containers/card.dart';
import 'package:enfluwence/widgets/header/session_header.dart';
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
              const SizedBox(height: ASizes.md),
              const HomeHeader(),
              ACard(
                child: Column(children: [
                  const TaskButton(),
                  const SizedBox(height: ASizes.md),
                  const FundAccountButton(),
                  const SizedBox(height: ASizes.md),
                  TransactionsList(
                    heading: "Recent Spending",
                  ),
                ]),
              ),
              const Totals(),
              const SectionHeader(
                title: "Campaign Tasks",
                textButton: "View all",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
