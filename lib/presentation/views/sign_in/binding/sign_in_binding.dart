import 'package:get/get.dart';

import '../controller/sign_in_controller.dart';

/// Kelas `SignInBinding` adalah kelas yang mengikat dependensi untuk halaman login.
class SignInBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignInController>(() => SignInController());
  }
}
