import 'package:enfluwence/utills/consts/colors.dart';
import 'package:enfluwence/utills/helpers/helper_functions.dart';
import 'package:enfluwence/widgets/controllers/simple_tabs_controller.dart';
import 'package:flutter/material.dart';

class SimpleTab extends StatelessWidget {
  SimpleTab({super.key, required this.tabs, required this.controller});
  final TabController controller;
  final List<Widget> tabs;
  @override
  Widget build(BuildContext context) {
    final isDark = AHelperFunctions.isDarkMode(context);
    var theme = Theme.of(context);
    return PreferredSize(
      preferredSize: const Size.fromHeight(kToolbarHeight),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          width: MediaQuery.of(context).size.width / 1.1,
          child: Theme(
            data: theme.copyWith(
              colorScheme: theme.colorScheme.copyWith(
                surfaceVariant: Colors.transparent,
              ),
            ),
            child: TabBar(
              controller: controller,
              labelPadding: EdgeInsets.all(20),
              labelColor: isDark ? AColor.white : AColor.lprimary,
              isScrollable: true,
              unselectedLabelColor: AColor.gray,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorColor: Colors.transparent,
              indicatorPadding: EdgeInsets.zero,
              indicatorWeight: double.minPositive,
              overlayColor:
                  MaterialStateProperty.all<Color>(Colors.transparent),
              tabs: tabs,
            ),
          ),
        ),
      ),
    );
  }
}
