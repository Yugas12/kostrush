import 'package:get/get.dart';

import '../controller/selected_result_controller.dart';

class SelectedResultBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SelectedResultController>(() => SelectedResultController());
  }
}
