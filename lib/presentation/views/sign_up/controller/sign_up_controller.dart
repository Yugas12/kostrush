import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kostrushapp/base/base_argument.dart';
import 'package:kostrushapp/base/base_state.dart';
import 'package:kostrushapp/presentation/views/account_sign_up/argument/account_sign_up_argument.dart';
import 'package:kostrushapp/res/routes/app_routes.dart';

import '../../../../base/base_controller.dart';

/// Kelas SignUpController adalah kelas yang mengontrol tampilan dan logika bisnis untuk halaman pendaftaran.
class SignUpController extends BaseController<NoArguments, NoState> {
  late TextEditingController nameController;
  late TextEditingController occupationController;
  late TextEditingController phoneController;
  late TextEditingController addressController;

  RxBool isAgree = false.obs;

  @override

  /// Inisialisasi komponen.
  void initComponent() {
    nameController = TextEditingController();
    occupationController = TextEditingController();
    phoneController = TextEditingController();
    addressController = TextEditingController();
  }

  @override
  void onObserve() {}

  @override
  Future<void> onProcess() async {}

  /// Menghancurkan komponen yang digunakan dalam controller.
  @override
  void disposeComponent() {
    nameController.dispose();
    occupationController.dispose();
    phoneController.dispose();
    addressController.dispose();
    isAgree.close();
  }

  /// Navigasi ke halaman pendaftaran akun.
  void navigateToAccountSignUp() {
    /// Memeriksa apakah input nama kosong.
    /// Jika input kosong, menampilkan dialog error dengan pesan "Nama tidak boleh kosong".
    /// Dialog memiliki tombol "OK" yang akan menutup dialog.
    if (nameController.text.isEmpty) {
      Get.dialog(AlertDialog(
        title: const Text("Error"),
        content: const Text("Nama tidak boleh kosong"),
        actions: [
          TextButton(
            onPressed: () {
              /// Menutup dialog.
              Get.back();
            },
            child: const Text("OK"),
          ),
        ],
      ));
      return;
    }

    /// Memeriksa apakah kolom pekerjaan kosong.
    /// Jika kosong, menampilkan dialog error dengan pesan "Pekerjaan tidak boleh kosong".
    /// Dialog memiliki tombol "OK" yang akan menutup dialog.
    if (occupationController.text.isEmpty) {
      Get.dialog(
        AlertDialog(
          title: const Text("Error"),
          content: const Text("Pekerjaan tidak boleh kosong"),
          actions: [
            TextButton(
              onPressed: () {
                /// Menutup dialog.
                Get.back();
              },
              child: const Text("OK"),
            ),
          ],
        ),
      );
      return;
    }

    /// Memeriksa apakah input nomor telepon kosong.
    /// Jika kosong, menampilkan dialog error dengan pesan "Nomor telepon tidak boleh kosong".
    /// Dialog memiliki tombol "OK" yang akan menutup dialog.
    if (phoneController.text.isEmpty) {
      Get.dialog(
        AlertDialog(
          title: const Text("Error"),
          content: const Text("Nomor telepon tidak boleh kosong"),
          actions: [
            TextButton(
              onPressed: () {
                /// Menutup dialog.
                Get.back();
              },
              child: const Text("OK"),
            ),
          ],
        ),
      );
      return;
    }

    /// Memeriksa apakah alamat yang dimasukkan kosong.
    /// Jika alamat kosong, akan menampilkan dialog error dengan pesan "Alamat tidak boleh kosong".
    /// Dialog akan memiliki tombol "OK" yang akan menutup dialog.
    /// Jika alamat tidak kosong, tidak akan ada tindakan yang diambil.
    if (addressController.text.isEmpty) {
      Get.dialog(
        AlertDialog(
          title: const Text("Error"),
          content: const Text("Alamat tidak boleh kosong"),
          actions: [
            TextButton(
              onPressed: () {
                /// Menutup dialog.
                Get.back();
              },
              child: const Text("OK"),
            ),
          ],
        ),
      );
      return;
    }

    /// Memeriksa apakah pengguna telah menyetujui syarat dan ketentuan sebelum melanjutkan.
    /// Jika pengguna tidak setuju, akan ditampilkan dialog kesalahan.
    /// Dialog kesalahan akan menampilkan pesan yang mengingatkan pengguna untuk menyetujui syarat dan ketentuan.
    /// Setelah pengguna menekan tombol "OK" pada dialog, fungsi akan mengembalikan nilai.
    if (!isAgree.value) {
      Get.dialog(
        AlertDialog(
          title: const Text("Error"),
          content: const Text("Anda harus menyetujui syarat dan ketentuan"),
          actions: [
            TextButton(
              onPressed: () {
                /// Menutup dialog.
                Get.back();
              },
              child: const Text("OK"),
            ),
          ],
        ),
      );
      return;
    }

    /// Navigasi ke halaman pendaftaran akun dengan mengirimkan argumen yang diperlukan.
    ///
    /// [nameController] - Controller untuk input nama.
    /// [phoneController] - Controller untuk input nomor telepon.
    /// [occupationController] - Controller untuk input pekerjaan.
    /// [addressController] - Controller untuk input alamat.
    ///
    Get.toNamed(
      AppRoutes.signUpAccount,
      arguments: AccountSignUpArgument(
        name: nameController.text,
        phoneNumber: phoneController.text,
        occupation: occupationController.text,
        address: addressController.text,
      ),
    );
  }
}
