import 'package:get/get.dart';

import '../controller/account_sign_up_controller.dart';

class AccountSignUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AccountSignUpController>(() => AccountSignUpController());
  }
}
