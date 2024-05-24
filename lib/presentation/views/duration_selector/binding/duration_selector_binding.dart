import 'package:get/get.dart';

import '../controller/duration_selector_controller.dart';

/// Kelas DurationSelectorBinding adalah kelas yang bertanggung jawab untuk mengatur dependensi yang diperlukan oleh DurationSelectorController.
class DurationSelectorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DurationSelectorController>(() => DurationSelectorController());
  }
}
