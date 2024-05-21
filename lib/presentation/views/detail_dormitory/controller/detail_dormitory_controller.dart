import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kostrushapp/data/network/response/kost_response.dart';
import 'package:kostrushapp/domain/repository/kost_repository.dart';
import 'package:kostrushapp/presentation/views/detail_dormitory/argument/detail_dormitory_argument.dart';
import 'package:kostrushapp/res/assets/image_asset_constant.dart';

import '../../../../base/base_controller.dart';
import '../../../../res/routes/app_routes.dart';
import '../../../../utils/handler/http_error_handler.dart';
import '../../order_form/argument/order_form_argument.dart';

class DetailDormitoryController
    extends BaseController<DetailDormitoryArgument, KostResponse> {
  late PageController pageController;

  final _repository = Get.find<KostRepository>();

  RxInt currentIndex = 0.obs;

  List<String> imageList = [
    ImageAssetConstant.dormPlaceholder,
    ImageAssetConstant.dormPlaceholder2,
    ImageAssetConstant.dormPlaceholder3,
    ImageAssetConstant.dormPlaceholder4,
  ];

  @override
  void initComponent() {
    pageController = PageController();
  }

  @override
  void onObserve() {
    // TODO: implement onObserve
  }

  @override
  Future<void> onProcess() async {
    emitLoading();
    final result = await _repository.getKostById(arguments.id);

    result.fold(
      (exception) {
        emitError(exception.message);
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
      (result) => emitSuccess(result),
    );
  }

  @override
  void disposeComponent() {
    pageController.dispose();
    currentIndex.close();
  }

  void onPageChanged(int index) {
    currentIndex.value = index;
  }

  void nextPage() {
    pageController.nextPage(
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  void previousPage() {
    pageController.previousPage(
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  void navigateToOrderForm() {
    Get.toNamed(AppRoutes.orderForm,
        arguments: OrderFormArgument(
          kostId: arguments.id,
        ));
  }
}
