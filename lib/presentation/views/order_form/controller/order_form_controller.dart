import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kostrushapp/data/model/kost_model.dart';
import 'package:kostrushapp/data/network/response/kost_response.dart';
import 'package:kostrushapp/domain/repository/transaction_repository.dart';
import 'package:kostrushapp/presentation/views/duration_selector/argument/duration_selector_argument.dart';
import 'package:kostrushapp/presentation/views/order_form/argument/order_form_argument.dart';
import 'package:kostrushapp/res/routes/app_routes.dart';
import 'package:kostrushapp/utils/extensions/base_controller_ext.dart';
import 'package:kostrushapp/utils/extensions/date_time_ext.dart';
import 'package:kostrushapp/utils/service/camera_gallery_service.dart';

import '../../../../base/base_controller.dart';
import '../../../../data/enum/otp_purpose_enum.dart';
import '../../../../domain/repository/kost_repository.dart';
import '../../../../domain/repository/profile_repository.dart';
import '../../../../utils/handler/http_error_handler.dart';
import '../../../components/focus_node/no_focus_node.dart';
import '../../success/argument/success_argument.dart';

/// Controller untuk halaman formulir pemesanan.
class OrderFormController
    extends BaseController<OrderFormArgument, KostModel>
    with CameraGalleryService {
  final _repository = Get.find<TransactionRepository>();
  final _profileRepository = Get.find<ProfileRepository>();
  final _kostRepository = Get.find<KostRepository>();

  late TextEditingController nameController;
  late TextEditingController phoneController;
  late TextEditingController occupationController;
  late TextEditingController dateController;
  late TextEditingController durationController;

  late NoFocusNode noFocusNode;

  Rxn<File> selectedFile = Rxn<File>();
  Rxn<DateTime> selectedDate = Rxn<DateTime>();
  Rxn<DurationItem> selectedDuration = Rxn<DurationItem>();
  RxInt price = 0.obs;

  @override
  void initComponent() {
    nameController = TextEditingController();
    phoneController = TextEditingController();
    occupationController = TextEditingController();
    dateController = TextEditingController();
    durationController = TextEditingController();
    noFocusNode = NoFocusNode();
    price.value = 0;
  }

  @override
  void onObserve() {
    // TODO: implement onObserve
  }

  @override
  Future<void> onProcess() async {
    emitLoading();

    final result = await _profileRepository.getProfile();

    result.fold(
      (error) {
        emitError(error.toString());
      },
      (data) {
        nameController.text = data.name ?? "";
        phoneController.text = data.phoneNumber ?? "";
        occupationController.text = data.occupation ?? "";
      },
    );

    final kostResult = await _kostRepository.getKostById(arguments.kostId);

    kostResult.fold(
      (exception) {
        emitError(exception.message);
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
      (data) {
        price.value = int.tryParse(data.startPrice!) ?? 0;

        emitSuccess(data);
      },
    );
  }

  @override
  void disposeComponent() {
    nameController.dispose();
    phoneController.dispose();
    occupationController.dispose();
    dateController.dispose();
    durationController.dispose();
    noFocusNode.dispose();

    selectedFile.value = null;
    selectedFile.close();
    selectedDate.value = null;
    selectedDate.close();
    selectedDuration.value = null;
    selectedDuration.close();
    price.close();
  }

  /// Membuka galeri untuk memilih gambar.
  void launchGallery() async {
    openGallery(
        isPermissionGranted: await requestCameraGalleryPermissions(),
        onImagePicked: (file) {
          selectedFile.value = file;
        },
        onError: (error) {
          logger.e(error);
        });
  }

  /// Menampilkan dialog untuk memilih tanggal.
  void pickDate(BuildContext context) {
    showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
      initialDate: DateTime.now(),
      locale: const Locale("id", "ID"),
    ).then((value) {
      if (value != null) {
        selectedDate.value = value;
        dateController.text = selectedDate.value!.formatDate();
      }
    });
  }

  /// Navigasi ke halaman pemilih durasi.
  void navigateToDurationSelector() async {
    var result = await Get.toNamed(
      AppRoutes.selectDuration,
      arguments: DurationSelectorArgument(
        duration: selectedDuration.value,
      ),
    );

    logger.d("Result: $result");
    logger.d("Result: ${result.duration}");

    if (result != null && result is DurationSelectorArgument) {
      selectedDuration.value = result.duration;
      durationController.text = selectedDuration.value!.duration;

      logger.d("Result: ${result.duration?.duration}");

      price.value = (int.tryParse(state!.startPrice!) ?? 0) * selectedDuration.value!.value;
    }
  }

  /// Mengirimkan pesanan.
  void submitOrder() async {
    if (selectedFile.value == null) {
      Get.dialog(
        AlertDialog(
          title: const Text("Error"),
          content: const Text("Gambar tidak boleh kosong"),
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
      return;
    }

    /// Memeriksa apakah tanggal sudah dipilih.
    if (selectedDate.value == null) {
      Get.dialog(
        AlertDialog(
          title: const Text("Error"),
          content: const Text("Tanggal tidak boleh kosong"),
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
      return;
    }

    /// Memeriksa apakah durasi sudah dipilih.
    if (selectedDuration.value == null) {
      Get.dialog(
        AlertDialog(
          title: const Text("Error"),
          content: const Text("Durasi tidak boleh kosong"),
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
      return;
    }

    /// Mengirim data transaksi ke server.
    final result = await _repository.createTransaction(
      kostId: arguments.kostId,
      roomId: arguments.roomId,
      price: price.value,
      date: selectedDate.value!,
      duration: selectedDuration.value!.value,
      image: selectedFile.value!,
    );

    result.fold(
      (exception) {
        /// Menampilkan dialog error.
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
      (data) {
        /// Navigasi ke halaman sukses.
        navigateToSuccess();
      },
    );
  }

  /// Navigasi ke halaman sukses.
  void navigateToSuccess() {
    Get.toNamed(
      AppRoutes.success,
      arguments: SuccessArgument(
        context: OtpPurposeEnum.transaction,
        title: "Transaksi Berhasil",
        description:
            "Transaksi Anda berhasil dilakukan. Anda akan diarahkan ke halaman utama dalam 3 detik.",
        buttonText: "Kembali ke Beranda",
      ),
    );
  }
}
