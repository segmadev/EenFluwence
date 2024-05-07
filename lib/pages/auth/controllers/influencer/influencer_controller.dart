import 'package:enfluwence/data/repositories/authentication/authentication_repository.dart';
import 'package:enfluwence/http/influencer/influencer_api.dart';
import 'package:enfluwence/pages/influencers/models/user.dart';
import 'package:enfluwence/pages/transactions/models/transactions.dart';
import 'package:enfluwence/utills/helpers/network_manager.dart';
import 'package:enfluwence/utills/local_storage/storage_utility.dart';
import 'package:get/get.dart';

class InfluencerController extends GetxController {
  static InfluencerController get instance => Get.find();
  final influencerApi = Get.put(InfluencerApi());
  ALocalStorage storage = Get.find();
  final totalMoneySpent = 0.0.obs;
  final noOfTasks = 0.obs;
  final isLoadingRecent = true.obs;
  final recentSpending = <Transaction>[].obs;
  @override
  void onInit() {
    super.onInit();
    // redirect user if not loged in
    if (storage.readData("token") == null ||
        storage.readData("currentUser") == null) {
      AuthenticationRepository().screenRedirect();
    }
    getTaskAndMoneySpent();
    getRecentSpending();
  }

  Future<void> getTaskAndMoneySpent() async {
    final isConnected = await NetworkManager.instance.isConnected();
    if (!isConnected) return;
    try {
      final data = await influencerApi.task_add_money_spent();
      totalMoneySpent.value = double.parse(data["totalMoneySpent"].toString());
      print("Totals: " + data.toString());
      noOfTasks.value = int.parse(data["tasks"].toString());
    } catch (e) {
      print(e);
    }
  }

  Future<void> getRecentSpending() async {
    final isConnected = await NetworkManager.instance.isConnected();
    if (!isConnected) return;
    try {
      final data = await influencerApi.get_recent_spending();
      recentSpending.value = Transactions.fromJson(data).transactions;
      isLoadingRecent.value = false;
    } catch (e) {
      print(e);
    }
  }
}
