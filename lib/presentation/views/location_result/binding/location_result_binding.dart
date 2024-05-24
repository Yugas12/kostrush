import 'package:get/get.dart';

import '../controller/location_result_controller.dart';

/// Kelas LocationResultBinding adalah kelas yang mengatur dependensi untuk halaman LocationResult.
class LocationResultBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LocationResultController>(() => LocationResultController());
  }
}
