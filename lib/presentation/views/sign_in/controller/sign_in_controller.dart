import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kostrushapp/base/base_argument.dart';
import 'package:kostrushapp/base/base_state.dart';
import 'package:kostrushapp/domain/repository/auth_repository.dart';
import 'package:kostrushapp/res/routes/app_routes.dart';
import 'package:kostrushapp/utils/handler/http_error_handler.dart';

import '../../../../../base/base_controller.dart';

/// Kelas `SignInController` adalah kelas yang mengontrol logika untuk tampilan sign in.
/// Kelas ini merupakan turunan dari kelas `BaseController` dengan parameter tipe `NoArguments` dan `NoState`.
class SignInController extends BaseController<NoArguments, NoState> {

  /// Repository untuk autentikasi.
  /// Digunakan untuk mengakses data autentikasi.
  final _repository = Get.find<AuthRepository>();

  late TextEditingController emailController;
  late TextEditingController passwordController;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  /// Inisialisasi komponen pada saat komponen dibuat.
    /// Menginisialisasi [emailController] dan [passwordController].
    @override
    void initComponent() {
      emailController = TextEditingController();
      passwordController = TextEditingController();
    }

  @override
  void onObserve() {
    // TODO: implement onObserve
  }

  @override
  Future<void> onProcess() async {
    // TODO: implement onProcess
  }

  /// Method untuk membersihkan dan membuang sumber daya yang digunakan oleh komponen.
  @override
  void disposeComponent() {
    emailController.dispose();
    passwordController.dispose();
  }

  /// Fungsi untuk melakukan proses login.
  /// Menggunakan email dan password yang diinputkan oleh pengguna.
  /// Jika login berhasil, akan pindah ke halaman utama.
  /// Jika login gagal dengan kode status 401, akan menampilkan pesan error.
  void signIn() async {
    final data = await _repository.signIn(
      email: emailController.text,
      password: passwordController.text,
    );

    data.fold((exception) {
      if (exception.response?.statusCode == 401) {
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
    }, (result) {
      Get.offNamed(AppRoutes.main);
    });
  }

  /// Fungsi ini digunakan untuk navigasi ke halaman pendaftaran.
  void navigateToSignUp() {
    Get.toNamed(AppRoutes.signUp);
  }
}
