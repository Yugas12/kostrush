import 'package:get/get.dart';

import '../controller/order_form_controller.dart';

/// Kelas `OrderFormBinding` adalah kelas yang mengatur dependensi untuk halaman Order Form.
/// Kelas ini mengimplementasikan `Bindings` dari GetX untuk mengatur dependensi controller.
class OrderFormBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderFormController>(() => OrderFormController());
  }
}
