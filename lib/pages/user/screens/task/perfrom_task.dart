import 'package:enfluwence/pages/user/controllers/user_task_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PerformTask extends StatefulWidget {
  const PerformTask({super.key, required this.id});
  final String id;
  @override
  State<PerformTask> createState() => _PerformTaskState();

  // @override
  // Future<void> onInit() async {
  //   print("Welcome");

  // }
}

class _PerformTaskState extends State<PerformTask> {
  int _activeStepIndex = 0;
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController pincode = TextEditingController();

  List<Step> stepList() => [
        Step(
          state: _activeStepIndex <= 0 ? StepState.editing : StepState.complete,
          isActive: _activeStepIndex >= 0,
          title: const Text('Question 1'),
          content: Container(
            child: Column(
              children: [
                TextField(
                  controller: name,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Full Name',
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextField(
                  controller: email,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextField(
                  controller: pass,
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                ),
              ],
            ),
          ),
        ),
        Step(
          state: _activeStepIndex <= 1 ? StepState.editing : StepState.complete,
          isActive: _activeStepIndex >= 1,
          title: const Text('Question 2'),
          content: Container(
            child: Column(
              children: [
                const SizedBox(
                  height: 8,
                ),
                TextField(
                  controller: address,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Full House Address',
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextField(
                  controller: pincode,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Pin Code',
                  ),
                ),
              ],
            ),
          ),
        ),
        Step(
          state: StepState.complete,
          isActive: _activeStepIndex >= 2,
          title: const Text('Confrim Answers'),
          content: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Name: ${name.text}'),
                Text('Email: ${email.text}'),
                const Text('Password: *****'),
                Text('Address : ${address.text}'),
                Text('PinCode : ${pincode.text}'),
              ],
            ),
          ),
        ),
      ];

  void _onStepContinue() {
    if (_activeStepIndex < (stepList().length - 1)) {
      setState(() {
        _activeStepIndex += 1;
      });
    } else {
      print('Submited');
    }
  }

  void _onStepCancel() {
    if (_activeStepIndex == 0) {
      return;
    }

    setState(() {
      _activeStepIndex -= 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    final userTaskController = Get.put(UserTaskController());
    final task = userTaskController.get_task(widget.id);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfrom Task'),
      ),
      body: Stepper(
        type: StepperType.vertical,
        currentStep: _activeStepIndex,
        steps: stepList(),
        onStepContinue: _onStepContinue,
        onStepCancel: _onStepCancel,
        onStepTapped: (int index) {
          setState(() {
            _activeStepIndex = index;
          });
        },
      ),
    );
  }
}
