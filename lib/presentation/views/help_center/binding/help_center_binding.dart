import 'package:get/get.dart';

import '../controller/help_center_controller.dart';

/// Kelas HelpCenterBinding adalah kelas yang bertanggung jawab untuk mengatur dependensi yang diperlukan oleh halaman Help Center.
class HelpCenterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HelpCenterController>(() => HelpCenterController());
  }
}
