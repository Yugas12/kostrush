import 'package:get/get.dart';

import '../controller/sign_up_controller.dart';

/// Kelas SignUpBinding adalah kelas yang mengikat dependensi untuk halaman pendaftaran.
class SignUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignUpController>(() => SignUpController());
  }
}
