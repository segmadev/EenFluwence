import 'package:enfluwence/utills/consts/icons.dart';
import 'package:enfluwence/utills/consts/text.dart';
import 'package:enfluwence/widgets/buttons/lg_button.dart';
import 'package:flutter/material.dart';

class TaskButton extends StatelessWidget {
  const TaskButton({super.key});

  @override
  Widget build(BuildContext context) {
    return const LgButton(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Icon(AIcons.plus), Text(AText.createTask)],
      ),
    );
  }
}
