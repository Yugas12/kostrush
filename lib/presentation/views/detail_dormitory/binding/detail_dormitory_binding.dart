import 'package:get/get.dart';

import '../controller/detail_dormitory_controller.dart';

class DetailDormitoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailDormitoryController>(() => DetailDormitoryController());
  }
}
