import 'package:get/get.dart';

import '../controller/profile_controller.dart';

/// Kelas `ProfileBinding` adalah kelas yang mengatur dependensi untuk halaman profil.
/// Kelas ini mengimplementasikan `Bindings` dari GetX untuk mengatur dependensi.
class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileController>(() => ProfileController());
  }
}
