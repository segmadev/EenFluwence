import 'package:enfluwence/pages/influencers/models/task.dart';
import 'package:enfluwence/utills/helpers/helper_functions.dart';
import 'package:get/get.dart';

class TaskController extends GetxController {
  var captionList = <Caption>[
    Caption(
        index: AHelperFunctions.getRondomNums(),
        socialMedia: "",
        text: "",
        url: ""),
  ].obs;
  static createTask(Task task) {}

  addCaption() {
    captionList.add(Caption(
        index: AHelperFunctions.getRondomNums(),
        socialMedia: "",
        text: "",
        url: ""));
  }

  removeCaption({required int index}) {
    captionList.removeWhere((captionList) => captionList.index == index);
    print(index);
  }
}
