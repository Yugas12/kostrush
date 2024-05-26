import 'package:get/get.dart';

import '../controller/detail_profile_controller.dart';

/// Kelas DetailProfileBinding adalah kelas yang mengatur dependensi untuk halaman Detail Profile.
class DetailProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailProfileController>(() => DetailProfileController());
  }
}
