import 'package:get/get.dart';

import '../controller/main_controller.dart';
import '../tabs/dashboard/controller/dashboard_controller.dart';
import '../tabs/profile/controller/profile_controller.dart';
import '../tabs/transaction/controller/transaction_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainController>(() => MainController());
    Get.lazyPut<DashboardController>(() => DashboardController());
    Get.lazyPut<ProfileController>(() => ProfileController());
    Get.lazyPut<TransactionController>(() => TransactionController());
  }
}
