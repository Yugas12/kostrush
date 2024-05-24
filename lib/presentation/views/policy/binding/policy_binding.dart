import 'package:get/get.dart';

import '../controller/policy_controller.dart';

/// Kelas `PolicyBinding` adalah kelas yang mengimplementasikan `Bindings`.
/// Kelas ini digunakan untuk mengatur dependensi yang diperlukan oleh halaman kebijakan.
class PolicyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PolicyController>(() => PolicyController());
  }
}
