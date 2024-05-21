import 'package:get/get.dart';

import '../controller/order_form_controller.dart';

class OrderFormBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderFormController>(() => OrderFormController());
  }
}
