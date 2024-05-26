import 'package:get/get.dart';

import '../controller/detail_transaction_controller.dart';

/// Kelas DetailTransactionBinding adalah kelas yang mengatur dependensi untuk halaman Detail Transaksi.
class DetailTransactionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailTransactionController>(
        () => DetailTransactionController());
  }
}
