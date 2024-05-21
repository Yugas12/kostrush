import 'package:get/get.dart';

import '../controller/policy_controller.dart';

class PolicyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PolicyController>(() => PolicyController());
  }
}
