import 'package:get/get.dart';

import '../controller/account_sign_up_controller.dart';

/// Kelas AccountSignUpBinding adalah kelas yang digunakan untuk mengatur dependensi yang diperlukan
/// untuk tampilan AccountSignUp.
class AccountSignUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AccountSignUpController>(() => AccountSignUpController());
  }
}
