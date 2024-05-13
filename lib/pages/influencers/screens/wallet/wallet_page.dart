import 'package:enfluwence/pages/auth/controllers/influencer/influencer_controller.dart';
import 'package:enfluwence/pages/influencers/screens/wallet/balance.dart';
import 'package:enfluwence/pages/influencers/screens/wallet/fund_account_botton.dart';
import 'package:enfluwence/pages/transactions/screens/account/linked_account.dart';
import 'package:enfluwence/pages/transactions/screens/transactions_list.dart';
import 'package:enfluwence/utills/consts/colors.dart';
import 'package:enfluwence/utills/consts/size.dart';
import 'package:enfluwence/utills/consts/text.dart';
import 'package:enfluwence/utills/helpers/helper_functions.dart';
import 'package:enfluwence/widgets/buttons/primary_button.dart';
import 'package:enfluwence/widgets/buttons/round_button.dart';
import 'package:enfluwence/widgets/containers/card.dart';
import 'package:enfluwence/widgets/containers/page_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = AHelperFunctions.isDarkMode(context);
    InfluencerController influncerController = Get.find();
    return PageContainer(
      children: [
        ACard(
            child: Column(
          children: [
            const SizedBox(height: ASizes.md),
            const Balance(),
            const SizedBox(height: ASizes.md),
            FundAccountButton(
              backgroundColor: Theme.of(context).primaryColor,
              color: isDark ? AColor.black : AColor.white,
            ),
            const SizedBox(height: ASizes.md),
            PrimaryButton(
              onPressed: () {
                Get.to(LinkedAccount());
              },
              name: AText.linkedAccounts,
              backgroundColor: AColor.lightSuccess.withOpacity(0.1),
              color: isDark ? AColor.white : AColor.black,
              height: 60,
            ),
            const SizedBox(height: ASizes.md),
            Obx(() => influncerController.isLoadingRecent.value
                ? ACard(
                    child: Center(child: Text("Loading...")),
                  )
                : TransactionsList(
                    heading: "Transactions",
                    transList: influncerController.spending!.value,
                  )),
          ],
        )),
      ],
    );
  }
}
