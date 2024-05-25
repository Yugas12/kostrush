import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kostrushapp/data/network/response/kost_response.dart';
import 'package:kostrushapp/domain/repository/kost_repository.dart';

import '../../../../base/base_argument.dart';
import '../../../../base/base_controller.dart';
import '../../../../data/model/kost_model.dart';
import '../../../../res/routes/app_routes.dart';
import '../../../../utils/handler/http_error_handler.dart';
import '../../detail_dormitory/argument/detail_dormitory_argument.dart';

/// Kelas `SearchViewController` adalah kelas yang bertanggung jawab untuk mengontrol tampilan pencarian.
class SearchViewController
    extends BaseController<NoArguments, List<KostModel>> {
  /// Repository kost.
  final _repository = Get.find<KostRepository>();

  late TextEditingController searchController;
  late FocusNode focusNode;

  /// Timer untuk menunda pencarian.
  late Timer _timer;

  /// Inisialisasi komponen search controller.
  /// Menginisialisasi [searchController] sebagai TextEditingController,
  /// [focusNode] sebagai FocusNode, dan [_timer] sebagai Timer dengan durasi 1200 milidetik.
  @override
  void initComponent() {
    searchController = TextEditingController();
    focusNode = FocusNode();
    _timer = Timer(const Duration(milliseconds: 1200), () {});
  }

  /// Fungsi ini digunakan untuk mengatur fokus pada `focusNode`.
  @override
  void onObserve() {
    focusNode.requestFocus();
  }

  /// Fungsi ini akan dipanggil ketika proses pencarian dimulai.
  /// Fungsi ini akan memanggil fungsi searchDormitory() untuk melakukan pencarian asrama.
  @override
  Future<void> onProcess() async {
    searchDormitory();
  }

  /// Fungsi untuk melakukan pencarian asrama.
  ///
  /// [query] adalah parameter opsional yang digunakan untuk melakukan pencarian berdasarkan kata kunci.
  /// Jika [query] tidak diberikan, maka pencarian akan dilakukan tanpa kata kunci.
  ///
  /// Fungsi ini akan mengeluarkan tampilan loading saat pencarian sedang berlangsung.
  /// Jika pencarian berhasil, hasil pencarian akan diemit sebagai hasil sukses.
  /// Jika terjadi kesalahan saat pencarian, akan diemit pesan kesalahan dan ditampilkan dialog error.
  Future<void> searchDormitory([String query = ""]) async {
    emitLoading();
    final data = await _repository.searchKost(query);

    data.fold(
      (exception) {
        emitError(exception.message);

        /// Menampilkan dialog peringatan jika status code bukan 404.
        Get.dialog(AlertDialog(
          title: const Text("Error"),
          content: Text(
              HttpErrorHandler.parseErrorResponse(exception.response?.data)),
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: const Text("OK"),
            ),
          ],
        ));
      },
      (result) => emitSuccess(result),
    );
  }

  /// Fungsi ini dipanggil ketika nilai pencarian berubah.
  /// Membatalkan timer sebelumnya dan membuat timer baru untuk menunda pencarian selama 1200 milidetik (1.2 detik).
  /// Setelah timer berakhir, fungsi [searchDormitory] akan dipanggil dengan nilai pencarian yang diberikan.
  onChangeSearch(String value) {
    _timer.cancel();
    _timer = Timer(const Duration(milliseconds: 1200), () {
      searchDormitory(value);
    });
  }

  /// Navigasi ke halaman detail asrama berdasarkan ID kost.
  ///
  /// Jika [kostId] tidak null, maka akan melakukan navigasi ke halaman detail asrama
  /// dengan menggunakan [AppRoutes.detailDormitory] sebagai rute dan [kostId] sebagai argumen.
  ///
  /// Jika [kostId] null, maka akan menampilkan dialog error dengan pesan "Data tidak ditemukan".
  /// Dialog error akan memiliki tombol "OK" yang akan menutup dialog.
  void navigateToDetailDormitory(int? kostId) {
    if (kostId != null) {
      Get.toNamed(AppRoutes.detailDormitory, arguments: DetailDormitoryArgument(kostId));
    } else {
      Get.dialog(
        AlertDialog(
          title: const Text("Error"),
          content: const Text("Data tidak ditemukan"),
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: const Text("OK"),
            ),
          ],
        ),
      );
    }
  }

  /// Method untuk membersihkan dan membuang sumber daya yang digunakan oleh komponen pencarian.
  @override
  void disposeComponent() {
    focusNode.unfocus();
    searchController.dispose();
    focusNode.dispose();
  }
}
