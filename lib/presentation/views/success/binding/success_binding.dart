import 'package:get/get.dart';

import '../controller/success_controller.dart';

/// Kelas SuccessBinding adalah kelas yang mengikat dependensi untuk halaman Success.
class SuccessBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SuccessController>(() => SuccessController());
  }
}
