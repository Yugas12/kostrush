import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kostrushapp/data/network/response/kost_response.dart';
import 'package:kostrushapp/presentation/views/selected_result/argument/selected_result_argument.dart';

import '../../../../base/base_controller.dart';
import '../../../../domain/repository/main_repository.dart';
import '../../../../res/routes/app_routes.dart';
import '../../../../utils/handler/http_error_handler.dart';
import '../../detail_dormitory/argument/detail_dormitory_argument.dart';

/// Kelas `SelectedResultController` adalah pengontrol untuk tampilan hasil terpilih.
/// Kelas ini mewarisi `BaseController` dan menggunakan `SelectedResultArgument` sebagai argumen masukan
/// dan `List<KostResponse>` sebagai hasil keluaran.
class SelectedResultController
    extends BaseController<SelectedResultArgument, List<KostResponse>> {
  /// Repository utama.
  final _repository = Get.find<MainRepository>();

  @override
  void initComponent() {
    // TODO: implement initComponent
  }

  @override
  void onObserve() {
    // TODO: implement onObserve
  }

  @override

  /// Fungsi ini digunakan untuk memproses data yang diperlukan untuk tampilan hasil terpilih.
  /// Fungsi ini akan dijalankan secara asynchronous.
  Future<void> onProcess() async {
    emitLoading();
    final result = await _repository.getRecommendedKost();

    result.fold(
      (exception) {
        emitError(exception.message);

        /// Menampilkan dialog peringatan jika status code bukan 404.
        if (exception.response?.statusCode != 404) {
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
        }
      },
      (result) => emitSuccess(result),
    );
  }

  @override
  void disposeComponent() {
    // TODO: implement disposeComponent
  }

  /// Navigasi ke halaman detail kos-kosan berdasarkan ID kos-kosan.
  ///
  /// Parameter [kostId] adalah ID kos-kosan yang akan ditampilkan di halaman detail.
  void navigateToDetailDormitory(int? kostId) {
    /// Jika ID kos-kosan tidak null, maka akan diarahkan ke halaman detail kos-kosan.
    if (kostId != null) {
      Get.toNamed(AppRoutes.detailDormitory,
          arguments: DetailDormitoryArgument(kostId));
    } else {
      Get.dialog(AlertDialog(
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
      ));
    }
  }

  /// Mendapatkan judul berdasarkan konteks.
  String get title {
    switch (arguments.context) {
      case SelectedResultContext.popularDormitory:
        return "Kost Populer";
      case SelectedResultContext.cheapDormitory:
        return "Kost Termurah";
    }
  }
}
