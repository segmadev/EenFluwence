import 'package:enfluwence/pages/general/models/task.dart';
import 'package:flutter/material.dart';

class QuestionList extends StatelessWidget {
  const QuestionList({super.key, required this.question});
  final Question question;

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text("Question:"),
      ],
    );
  }
}
