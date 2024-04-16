import 'package:enfluwence/pages/transactions/models/transactions.dart';
import 'package:enfluwence/pages/transactions/screens/single_transaction.dart';
import 'package:enfluwence/utills/consts/size.dart';
import 'package:enfluwence/utills/consts/text.dart';
import 'package:flutter/material.dart';

class TransactionsList extends StatelessWidget {
  TransactionsList(
      {super.key,
      this.heading = AText.transactionHeading,
      this.transList,
      this.showHeading = true});
  final List? transList;
  final String heading;
  final bool showHeading;

  @override
  Widget build(BuildContext context) {
    List listOfTrans = transList ?? Transactions.getTrans();
    // transList ??= Transactions.getTrans();
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          showHeading
              ? Text(
                  heading,
                  style: Theme.of(context).textTheme.bodySmall,
                  textAlign: TextAlign.start,
                )
              : const Text(""),
          SizedBox(height: ASizes.md),
          Column(
            children: listOfTrans.map((trans) {
              return SingleTransaction(
                trans: trans,
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
