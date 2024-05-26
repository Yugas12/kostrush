import 'package:get/get.dart';
import 'package:kostrushapp/base/base_argument.dart';
import 'package:kostrushapp/base/base_state.dart';
import 'package:kostrushapp/domain/use_case/app_use_case.dart';
import 'package:kostrushapp/res/routes/app_routes.dart';
import 'package:kostrushapp/utils/extensions/base_controller_ext.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../../../base/base_controller.dart';

/// Kelas `SplashController` adalah pengontrol untuk tampilan splash screen.
/// Ini merupakan turunan dari kelas `BaseController` dengan argumen `NoArguments` dan state `NoState`.
class SplashController extends BaseController<NoArguments, NoState> {
  /// Controller untuk tampilan splash.
  /// Digunakan untuk menginisialisasi dan mengontrol logika tampilan splash.
  final _appUseCase = Get.find<ApplicationUseCase>();

  /// Variabel [appVersion] adalah variabel RxnString yang digunakan untuk menyimpan versi aplikasi.
  RxnString appVersion = RxnString(null);

  /// Menginisialisasi variabel `packageInfo` dengan instance dari `PackageInfo`.
  final packageInfo = Get.find<PackageInfo>();

  @override
  void initComponent() {}

  /// Method yang dipanggil saat observasi dimulai.
  @override
  void onObserve() {
    _startSplash();
  }

  /// Fungsi ini akan dipanggil saat proses berjalan.
  /// Fungsi ini akan mengupdate nilai `appVersion` dengan versi dari packageInfo.
  @override
  Future<void> onProcess() async {
    appVersion.value = packageInfo.version;
  }

  /// Menghapus semua sumber daya yang digunakan oleh komponen SplashController.
  @override
  void disposeComponent() {
    appVersion.value = null;
    appVersion.close();
  }

  /// Fungsi untuk memulai tampilan splash screen.
  /// Fungsi ini akan memeriksa apakah pengguna sudah masuk atau belum,
  /// menunggu selama 3 detik, dan kemudian mengarahkan pengguna ke tampilan
  /// utama jika sudah masuk atau ke tampilan masuk jika belum masuk.
  Future<void> _startSplash() async {
    final bool isSignIn = await _appUseCase.isUserLoggedIn();
    await Future.delayed(
      const Duration(
        seconds: 3,
      ),
    );

    logger.d("isSignIn: $isSignIn");

    if (isSignIn) {
      /// Jika pengguna sudah masuk, maka akan langsung diarahkan ke tampilan utama.
      Get.offNamed(AppRoutes.main);
    } else {
      /// Jika pengguna belum masuk, maka akan diarahkan ke tampilan masuk.
      Get.offNamed(AppRoutes.signIn);
    }
  }
}
