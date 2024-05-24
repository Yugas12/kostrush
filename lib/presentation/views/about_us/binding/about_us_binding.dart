import 'package:get/get.dart';

import '../controller/about_us_controller.dart';

/// Kelas [AboutUsBinding] adalah kelas yang digunakan untuk mengatur dependensi
/// yang diperlukan oleh halaman About Us.
class AboutUsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AboutUsController>(() => AboutUsController());
  }
}
