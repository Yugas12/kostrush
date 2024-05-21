import 'package:get/get.dart';

import '../controller/detail_profile_controller.dart';

class DetailProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailProfileController>(() => DetailProfileController());
  }
}
