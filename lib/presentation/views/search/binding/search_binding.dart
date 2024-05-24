import 'package:get/get.dart';

import '../controller/search_controller.dart';

/// Kelas `SearchBinding` adalah kelas yang mengimplementasikan `Bindings` dari GetX.
/// Kelas ini bertanggung jawab untuk mengatur dependensi yang diperlukan untuk halaman pencarian.
class SearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchViewController>(() => SearchViewController());
  }
}
