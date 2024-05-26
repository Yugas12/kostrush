import 'package:get/get.dart';

import '../controller/selected_result_controller.dart';

/// Kelas `SelectedResultBinding` adalah kelas yang mengimplementasikan `Bindings`.
/// Kelas ini digunakan untuk menghubungkan dependensi yang diperlukan oleh halaman `SelectedResult`.
class SelectedResultBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SelectedResultController>(() => SelectedResultController());
  }
}
