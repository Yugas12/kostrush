import 'package:get/get.dart';

import '../controller/detail_dormitory_controller.dart';

/// Kelas DetailDormitoryBinding adalah kelas yang digunakan untuk mengatur dependensi
/// yang diperlukan oleh halaman Detail Dormitory.
class DetailDormitoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailDormitoryController>(() => DetailDormitoryController());
  }
}
