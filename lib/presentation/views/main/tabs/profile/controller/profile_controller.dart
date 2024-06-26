import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kostrushapp/base/base_argument.dart';
import 'package:kostrushapp/data/enum/otp_purpose_enum.dart';
import 'package:kostrushapp/data/model/profile_model.dart';
import 'package:kostrushapp/presentation/views/change_password/argument/change_password_argument.dart';
import 'package:kostrushapp/res/routes/app_routes.dart';

import '../../../../../../base/base_controller.dart';
import '../../../../../../domain/repository/auth_repository.dart';
import '../../../../../../domain/repository/main_repository.dart';

/// Kelas `ProfileController` adalah pengontrol untuk halaman profil pengguna.
/// Kelas ini mengimplementasikan `BaseController` dengan argumen `NoArguments` dan model `ProfileModel`.
class ProfileController extends BaseController<NoArguments, ProfileModel> {
  final _authRepository = Get.find<AuthRepository>();
  final _mainRepository = Get.find<MainRepository>();

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
    final data = await _mainRepository.getProfile();

    data.fold((exception) {
      emitError(exception.toString());
      Get.dialog(AlertDialog(
        title: Text("Error"),
        content: Text("Terjadi kesalahan. Silakan coba lagi nanti."),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text("OK"),
          ),
        ],
      ));
    }, (response) {
      emitSuccess(response);
    });
  }

  @override
  void disposeComponent() {
    // TODO: implement disposeComponent
  }

  /// Metode ini digunakan untuk navigasi ke halaman edit profil.
  /// Metode ini akan menunggu navigasi selesai sebelum memanggil metode `onRefresh`.
  void navigateToEditProfile() async {
    await Get.toNamed(AppRoutes.editProfile);
    onRefresh();
  }

  /// Metode ini digunakan untuk navigasi ke halaman detail profil.
  void navigateToDetailProfile() {
    Get.toNamed(AppRoutes.detailProfile);
  }

  /// Metode ini digunakan untuk navigasi ke halaman ubah kata sandi.
  /// Metode ini juga mengirimkan argumen `ChangePasswordArgument` yang berisi konteks dan email pengguna.
  void navigateToChangePassword() {
    Get.toNamed(
      AppRoutes.changePassword,
      arguments: ChangePasswordArgument(
        context: OtpPurposeEnum.changePassword,
        email: state?.email ?? "",
      ),
    );
  }

  /// Metode ini digunakan untuk navigasi ke halaman kebijakan privasi.
  void navigateToPolicy() {
    Get.toNamed(AppRoutes.policy);
  }

  /// Metode ini digunakan untuk navigasi ke halaman tentang kami.
  void navigateToAboutUs() {
    Get.toNamed(AppRoutes.aboutUs);
  }

  /// Metode ini digunakan untuk navigasi ke pusat bantuan.
  void navigateToHelpCenter() {
    Get.toNamed(AppRoutes.helpCenter);
  }

  /// Metode ini digunakan untuk keluar dari akun pengguna.
  /// Metode ini akan menampilkan dialog konfirmasi jika terjadi kesalahan saat keluar.
  void signOut() async {
    final data = await _authRepository.signOut();
    data.fold((exception) {
      Get.dialog(AlertDialog(
        title: Text("Error"),
        content: Text("Terjadi kesalahan. Silakan coba lagi nanti."),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text("OK"),
          ),
        ],
      ));
    }, (_) {});
    Get.offAllNamed(AppRoutes.signIn);
  }
}
