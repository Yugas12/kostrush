import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kostrushapp/data/network/response/kost_response.dart';
import 'package:kostrushapp/domain/repository/kost_repository.dart';
import 'package:kostrushapp/presentation/views/location_result/argument/location_result_argument.dart';

import '../../../../base/base_controller.dart';
import '../../../../res/routes/app_routes.dart';
import '../../../../utils/handler/http_error_handler.dart';
import '../../detail_dormitory/argument/detail_dormitory_argument.dart';

/// Controller untuk tampilan hasil lokasi.
class LocationResultController
    extends BaseController<LocationResultArgument, List<KostResponse>> {
  final _repository = Get.find<KostRepository>();

  @override
  void initComponent() {
    // TODO: implement initComponent
  }

  @override
  void onObserve() {
    // TODO: implement onObserve
  }

  @override
  Future<void> onProcess() async {
    emitLoading();
    final result =
        await _repository.getKostBySubLocality(arguments.locationName);

    result.fold(
      (exception) {
        emitError(exception.message);

        if (exception.response?.statusCode! != 404 & 400) {
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

  /// Navigasi ke halaman detail asrama.
  ///
  /// [kostId] ID dari kost yang akan ditampilkan detailnya.
  void navigateToDetailDormitory(int? kostId) {
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
}
