import 'package:enfluwence/pages/influencers/models/user.dart';

class Tasks extends User {
  static List getCampaign() {
    var taskList = [
      {
        "id": 1,
        "type_id": 1,
        "is_campaign": true,
        "engagements": 10,
        "total_number_of_engagements": 5,
        "cost_per_engagement": 200,
        "total_cost": 1000,
        "is_paid": true,
        "views": 200,
        "is_completed": false,
        "created_at": 1713260337,
      },
      {
        "id": 1,
        "type_id": 2,
        "is_campaign": true,
        "engagements": 10,
        "total_number_of_engagements": 5,
        "cost_per_engagement": 200,
        "total_cost": 1000,
        "is_paid": true,
        "views": 200,
        "is_completed": true,
        "created_at": 1713260337,
      },
      {
        "id": 1,
        "type_id": 4,
        "is_campaign": true,
        "engagements": 10,
        "total_number_of_engagements": 5,
        "cost_per_engagement": 200,
        "total_cost": 1000,
        "is_paid": true,
        "views": 200,
        "is_completed": false,
        "created_at": 1713260337,
      },
      {
        "id": 1,
        "type_id": 3,
        "is_campaign": true,
        "engagements": 10,
        "total_number_of_engagements": 5,
        "cost_per_engagement": 200,
        "total_cost": 1000,
        "is_paid": true,
        "views": 200,
        "is_completed": true,
        "created_at": 1713260337,
      },
      {
        "id": 1,
        "type_id": 1,
        "is_campaign": true,
        "engagements": 10,
        "total_number_of_engagements": 5,
        "cost_per_engagement": 200,
        "total_cost": 1000,
        "is_paid": true,
        "views": 200,
        "is_completed": true,
        "created_at": 1713260337,
      },
      {
        "id": 1,
        "type_id": 2,
        "is_campaign": true,
        "engagements": 10,
        "total_number_of_engagements": 5,
        "cost_per_engagement": 200,
        "total_cost": 1000,
        "is_paid": true,
        "views": 200,
        "is_completed": true,
        "created_at": 1713260337,
      },
    ];
    return taskList;
  }

  static String getTaskName(int id) {
    final List taskNames = [
      "Facebook Campaign",
      "Twitter Campaign",
      "Instragm Campaign",
      "Youtube Campaign"
    ];
    return taskNames[id - 1];
  }
}
