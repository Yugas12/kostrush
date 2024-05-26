import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kostrushapp/data/model/profile_model.dart';
import 'package:kostrushapp/domain/repository/profile_repository.dart';

import '../../../../base/base_argument.dart';
import '../../../../base/base_controller.dart';
import '../../../../utils/handler/http_error_handler.dart';

/// Kelas `EditProfileController` adalah pengontrol untuk tampilan edit profil.
/// Kelas ini mengimplementasikan `BaseController` dengan argumen `NoArguments` dan model `ProfileModel`.
class EditProfileController extends BaseController<NoArguments, ProfileModel> {
  /// Digunakan untuk mengakses repository profil.
  final _repository = Get.find<ProfileRepository>();

  late TextEditingController nameController;
  late TextEditingController occupationController;
  late TextEditingController phoneController;
  late TextEditingController addressController;
  late TextEditingController emailController;

  RxBool isFileChange = false.obs;
  Rxn<File> imageFile = Rxn<File>(null);

  /// Inisialisasi komponen.
  @override
  void initComponent() {
    nameController = TextEditingController();
    occupationController = TextEditingController();
    phoneController = TextEditingController();
    addressController = TextEditingController();
    emailController = TextEditingController();
  }

  @override
  void onObserve() {}

  @override

  /// Fungsi ini digunakan untuk menjalankan proses yang terkait dengan edit profil.
  /// Fungsi ini akan dijalankan secara asynchronous.
  Future<void> onProcess() async {
    emitLoading();

    /// Mengambil profil pengguna dari repository.
    final data = await _repository.getProfile();

    data.fold((exception) {
      /// Menampilkan pesan error dan dialog peringatan.
      ///
      /// Metode ini menerima [exception] sebagai parameter dan menampilkan pesan error
      /// serta dialog peringatan dengan pesan "Something went wrong. Please try again later."
      /// dan tombol "OK" untuk menutup dialog.
      void emitError(String exception) {
        emitError(exception.toString());
        Get.dialog(AlertDialog(
          title: const Text("Error"),
          content: const Text("Something went wrong. Please try again later."),
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
    }, (response) {
      emitSuccess(response);

      /// Mengisi nilai-nilai dari objek [response] ke dalam controller yang sesuai.
      /// Jika nilai-nilai dari [response] null, maka controller akan diisi dengan string kosong.
      nameController.text = response.name ?? "";
      occupationController.text = response.occupation ?? "";
      phoneController.text = response.phoneNumber ?? "";
      addressController.text = response.address ?? "";
      emailController.text = response.email ?? "";
    });
  }

  /// Fungsi ini digunakan untuk memperbarui profil pengguna.
  Future<void> updateProfile() async {
    /// Mengupdate profil dengan menggunakan data yang diinputkan.
    ///
    /// Parameter:
    /// - name: Nama pengguna yang akan diupdate.
    /// - occupation: Pekerjaan pengguna yang akan diupdate.
    /// - address: Alamat pengguna yang akan diupdate.
    /// - phoneNumber: Nomor telepon pengguna yang akan diupdate.
    /// - email: Email pengguna yang akan diupdate.
    ///
    /// Return:
    /// - Future yang mengembalikan data hasil update profil.
    final data = await _repository.updateProfile(
      name: nameController.text,
      occupation: occupationController.text,
      address: addressController.text,
      phoneNumber: phoneController.text,
      email: emailController.text,
    );

    /// Menghandle hasil dari operasi `fold` pada `data`.
    /// Jika terjadi `exception`, akan menampilkan pesan error dan dialog error.
    /// Jika berhasil, akan menutup dialog saat ini.
    ///
    /// Parameter:
    /// - `data`: Hasil dari operasi `fold`.
    data.fold(
      (exception) {
        /// Menampilkan dialog error dengan pesan yang diberikan oleh `exception`.
        /// Dialog akan menampilkan judul "Error" dan konten berupa pesan error yang diambil dari `exception.response?.data`.
        /// Dialog akan memiliki tombol "OK" yang akan menutup dialog saat ditekan.
        emitError(exception.toString());
        Get.dialog(
          AlertDialog(
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
          ),
        );
      },
      (response) {
        /// Kembali ke halaman sebelumnya.
        Get.back();
      },
    );
  }

  /// Method untuk membersihkan dan membebaskan sumber daya yang digunakan oleh komponen.
  @override
  void disposeComponent() {
    nameController.dispose();
    occupationController.dispose();
    phoneController.dispose();
    addressController.dispose();
    emailController.dispose();

    isFileChange.close();
    imageFile.close();
  }
}
