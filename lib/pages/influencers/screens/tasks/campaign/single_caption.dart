import 'package:enfluwence/pages/influencers/controllers/influencer_task_controller.dart';
import 'package:enfluwence/pages/general/models/task.dart';
import 'package:enfluwence/utills/consts/colors.dart';
import 'package:enfluwence/widgets/containers/card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SingleCaption extends StatefulWidget {
  const SingleCaption({super.key, required this.caption});
  final Caption caption;

  @override
  State<SingleCaption> createState() => _SingleCaptionState();
}

class _SingleCaptionState extends State<SingleCaption> {
  @override
  Widget build(BuildContext context) {
    final taskController = Get.find<TaskController>();
    final socialMedia = widget.caption.socialMedia;
    return ACard(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Platfrom: " + widget.caption.socialMedia!,
                  maxLines: 1,
                  overflow: TextOverflow.fade,
                  softWrap: true,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  "Title: " + widget.caption.text!,
                  maxLines: 1,
                  overflow: TextOverflow.fade,
                  softWrap: false,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  "URL: " + widget.caption.url!, //
                  style: Theme.of(context).textTheme.bodyLarge,
                  maxLines: 1,
                  overflow: TextOverflow.fade,
                  softWrap: true,
                ),
              ],
            ),
          ),
          IconButton(
              onPressed: () {
                taskController.removeCaption(index: widget.caption.index!);
              },
              icon: Icon(Icons.delete_rounded),
              color: AColor.danger)
        ],
      ),
    );
  }
}
