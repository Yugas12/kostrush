import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kostrushapp/data/network/response/transaction_response.dart';
import 'package:kostrushapp/presentation/views/detail_transaction/argument/detail_transaction_argument.dart';
import 'package:kostrushapp/utils/extensions/date_time_ext.dart';

import '../../../../base/base_controller.dart';
import '../../../../domain/repository/transaction_repository.dart';
import '../../../../utils/handler/http_error_handler.dart';
import '../../../components/focus_node/no_focus_node.dart';

class DetailTransactionController
    extends BaseController<DetailTransactionArgument, TransactionResponse> {
  final _repository = Get.find<TransactionRepository>();

  late TextEditingController nameController;
  late TextEditingController phoneController;
  late TextEditingController occupationController;
  late TextEditingController roomTypeController;
  late TextEditingController dateController;
  late TextEditingController durationController;

  late NoFocusNode noFocusNode;

  @override
  void initComponent() {
    nameController = TextEditingController();
    phoneController = TextEditingController();
    occupationController = TextEditingController();
    roomTypeController = TextEditingController();
    dateController = TextEditingController();
    durationController = TextEditingController();
    noFocusNode = NoFocusNode();
  }

  @override
  void onObserve() {
    // TODO: implement onObserve
  }

  @override
  Future<void> onProcess() async {
    emitLoading();
    final result = await _repository.getTransactionById(arguments.id);

    result.fold(
          (exception) {
        emitError(exception.toString());
        if (exception.response?.statusCode != 404) {
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
        }
      },
          (data) {
        nameController.text = data.user?.name ?? "";
        phoneController.text = data.user?.phoneNumber ?? "";
        occupationController.text = data.user?.occupation ?? "";
        roomTypeController.text = data.kost?.type ?? "";
        dateController.text = data.checkIn?.formatDate() ?? "";
        durationController.text = data.duration.toString();
        emitSuccess(data);
      },
    );
  }

  @override
  void disposeComponent() {
    nameController.dispose();
    phoneController.dispose();
    occupationController.dispose();
    roomTypeController.dispose();
    dateController.dispose();
    durationController.dispose();
    noFocusNode.dispose();
  }


}
