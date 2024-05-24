import 'package:get/get.dart';

import '../controller/transaction_controller.dart';

/// Kelas `TransactionBinding` adalah kelas yang mengatur dependensi untuk halaman transaksi.
/// Kelas ini mengimplementasikan `Bindings` dari GetX untuk mengatur dependensi yang diperlukan.
class TransactionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TransactionController>(() => TransactionController());
  }
}
