import 'package:get/get.dart';
import 'package:kostrushapp/utils/extensions/base_controller_ext.dart';

import 'base_argument.dart';

/// Kelas ini digunakan sebagai base class untuk controller yang digunakan untuk mengatur state management pada view.
/// Kelas ini menggunakan GetX untuk melakukan state management.
/// Kelas ini memiliki beberapa method yang digunakan untuk mengatur proses pada controller.
/// Kelas ini membutuhkan argument yang diimplementasikan dari BaseArguments.
/// StateMixin digunakan untuk mengatur state pada controller.
abstract class BaseController<T extends BaseArguments, M> extends GetxController
    with StateMixin<M> {
  dynamic _arguments = Get.arguments;

  T get arguments => _arguments as T;

  /// Method ini digunakan untuk mengambil argument yang dikirimkan dari view sebelumnya
  void retrieveArguments() {
    if (_arguments != null && _arguments is T) {
      _arguments;
      logger.d("Arguments retrieved ${_arguments.toString()}");
    }
  }

  /// Method ini digunakan untuk inisialisasi komponen
  void initComponent();

  /// Method ini digunakan untuk melakukan proses pada controller
  Future<void> onProcess();

  /// Method ini digunakan untuk mengamati controller
  void onObserve();

  /// Method ini digunakan untuk membersihkan komponen
  void disposeComponent();

  /// Method ini digunakan untuk melakukan refresh pada controller
  Future<void> onRefresh() async {
    onProcess();
  }

  /// Method ini digunakan untuk mengubah status menjadi loading
  emitLoading() {
    change(
      state,
      status: RxStatus.loading(),
    );
  }

  /// Method ini digunakan untuk mengubah status menjadi error
  emitError(String? message) {
    change(
      state,
      status: RxStatus.error(
        message,
      ),
    );
  }

  /// Method ini digunakan untuk mengubah status menjadi success
  emitSuccess(M? data) {
    change(
      data,
      status: RxStatus.success(),
    );
  }

  /// Method ini digunakan untuk mengubah status menjadi empty
  emitEmpty() {
    change(
      state,
      status: RxStatus.empty(),
    );
  }

  /// Method ini digunakan untuk mmenginisialisasi controller (bawaan GetX)
  @override
  void onInit() async {
    super.onInit();
    emitEmpty();
    retrieveArguments();
    initComponent();
    logger.d('$runtimeType component initialized');
    await onProcess();
  }

  /// Method ini digunakan untuk melakukan proses setelah controller siap (bawaan GetX)
  @override
  void onReady() {
    super.onReady();
    onObserve();
  }

  /// Method ini digunakan untuk membersihkan controller (bawaan GetX)
  @override
  void onClose() {
    disposeComponent();
    logger.d('$runtimeType component disposed');
    _arguments = null;
    super.onClose();
  }
}
