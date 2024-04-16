import 'package:enfluwence/pages/influencers/screens/wallet/balance.dart';
import 'package:enfluwence/pages/influencers/screens/wallet/fund_account_botton.dart';
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

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = AHelperFunctions.isDarkMode(context);
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
              name: AText.linkedAccounts,
              backgroundColor: AColor.lightSuccess.withOpacity(0.1),
              color: isDark ? AColor.white : AColor.black,
              height: 60,
            ),
            const SizedBox(height: ASizes.md),
            TransactionsList(
              heading: AText.transactionHeading,
            ),
          ],
        )),
      ],
    );
  }
}
