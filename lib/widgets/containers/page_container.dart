import 'package:enfluwence/utills/consts/size.dart';
import 'package:flutter/material.dart';

class PageContainer extends StatelessWidget {
  const PageContainer({super.key, required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: ASizes.defaultSpace),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: children,
              ),
              SizedBox(
                height: ASizes.defaultSpace,
              )
            ],
          ),
        ),
      ),
    );
  }
}
