import 'package:get/get.dart';

import '../controller/duration_selector_controller.dart';

class DurationSelectorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DurationSelectorController>(() => DurationSelectorController());
  }
}
