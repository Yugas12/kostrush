import 'package:get/get.dart';

import '../controller/change_password_controller.dart';

/// Kelas ChangePasswordBinding adalah kelas yang bertanggung jawab untuk mengatur dependensi yang diperlukan untuk halaman ganti password.
class ChangePasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChangePasswordController>(() => ChangePasswordController());
  }
}
