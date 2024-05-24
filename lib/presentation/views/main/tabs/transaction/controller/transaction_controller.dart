import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kostrushapp/base/base_argument.dart';
import 'package:kostrushapp/data/model/profile_model.dart';
import 'package:kostrushapp/data/network/response/transaction_response.dart';
import 'package:kostrushapp/domain/repository/transaction_repository.dart';

import '../../../../../../base/base_controller.dart';
import '../../../../../../res/routes/app_routes.dart';
import '../../../../../../utils/handler/http_error_handler.dart';
import '../../../../detail_transaction/argument/detail_transaction_argument.dart';

/// Kelas [TransactionController] adalah pengontrol untuk tampilan transaksi.
/// Kelas ini mengimplementasikan [BaseController] dengan argumen [NoArguments] dan hasil [List<TransactionResponse>].
class TransactionController extends BaseController<NoArguments, List<TransactionResponse>> {
  final _repository = Get.find<TransactionRepository>();

  late ProfileModel profile;

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
    final result = await _repository.getTransactions();

    result.fold(
      (exception) {
        emitError(exception.toString());
        Get.dialog(AlertDialog(
          title: Text("Error"),
          content: Text(
              HttpErrorHandler.parseErrorResponse(exception.response?.data)),
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: Text("OK"),
            ),
          ],
        ));
      },
      (data) {
        emitSuccess(data);
      },
    );
  }

  @override
  void disposeComponent() {
    // TODO: implement disposeComponent
  }

  /// Metode [navigateToDetailTransaction] digunakan untuk menavigasi ke halaman detail transaksi.
  /// Metode ini menerima [index] sebagai argumen yang menunjukkan indeks transaksi yang akan ditampilkan.
  void navigateToDetailTransaction(int index) {
    if (state != null) {
      Get.toNamed(
        AppRoutes.transactionDetail,
        arguments: DetailTransactionArgument(
          id: state![index].id!,
        ),
      );
    }
  }
}
