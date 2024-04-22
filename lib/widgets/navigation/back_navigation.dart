import 'package:enfluwence/widgets/appbar/appbar.dart';
import 'package:flutter/material.dart';

class BackNavigation extends StatelessWidget {
  const BackNavigation({super.key, this.body});
  final Widget? body;
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: const AAppBar(), body: body);
  }
}
