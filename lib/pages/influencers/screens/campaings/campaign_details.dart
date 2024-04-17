import 'package:enfluwence/utills/consts/size.dart';
import 'package:enfluwence/widgets/appbar/appbar.dart';
import 'package:enfluwence/widgets/containers/card.dart';
import 'package:enfluwence/widgets/containers/page_container.dart';
import 'package:flutter/material.dart';

class CampaignDetails extends StatelessWidget {
  const CampaignDetails({super.key, required this.campaign});
  final dynamic campaign;
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        appBar: AAppBar(),
        body: PageContainer(
          children: [
            SizedBox(
              height: ASizes.sm,
            ),
            ACard(
              child: Row(
                
              ),
            ),
          ],
        ));
  }
}
