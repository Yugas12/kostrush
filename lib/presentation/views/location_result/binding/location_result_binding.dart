import 'package:get/get.dart';

import '../controller/location_result_controller.dart';

class LocationResultBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LocationResultController>(() => LocationResultController());
  }
}
