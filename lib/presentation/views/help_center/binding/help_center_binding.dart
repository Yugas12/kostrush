import 'package:get/get.dart';

import '../controller/help_center_controller.dart';

class HelpCenterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HelpCenterController>(() => HelpCenterController());
  }
}
