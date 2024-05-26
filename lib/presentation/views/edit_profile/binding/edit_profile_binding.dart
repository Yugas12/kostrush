import 'package:get/get.dart';

import '../controller/edit_profile_controller.dart';

/// Kelas `EditProfileBinding` adalah kelas yang digunakan untuk mengatur dependensi yang diperlukan dalam halaman edit profil.
class EditProfileBinding extends Bindings {
  /// Mengatur dependensi untuk halaman Edit Profile.
    @override
    void dependencies() {
      Get.lazyPut<EditProfileController>(() => EditProfileController());
    }
}
