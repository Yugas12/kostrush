import 'package:get/get.dart';
import 'package:kostrushapp/domain/repository/auth_repository.dart';

import '../domain/repository/kost_repository.dart';
import '../domain/repository/main_repository.dart';
import '../domain/repository/profile_repository.dart';
import '../domain/repository/transaction_repository.dart';

/// Inisialisasi modul repository.
/// Membuat instance dari berbagai repository yang akan digunakan dalam aplikasi.
Future<void> initRepositoryModule() async {
  // Membuat instance AuthRepository
  Get.putAsync(
    () async => AuthRepository(
      Get.find(),
      Get.find(),
      Get.find(),
    ),
  );

  // Membuat instance MainRepository
  Get.putAsync(
    () async => MainRepository(
      Get.find(),
      Get.find(),
      Get.find(),
      Get.find(),
    ),
  );

  // Membuat instance KostRepository
  Get.putAsync(
    () async => KostRepository(
      Get.find(),
      Get.find(),
    ),
  );

  // Membuat instance TransactionRepository
  Get.putAsync(
    () async => TransactionRepository(
      Get.find(),
      Get.find(),
    ),
  );

  // Membuat instance ProfileRepository
  Get.putAsync(
    () async => ProfileRepository(
      Get.find(),
      Get.find(),
      Get.find(),
    ),
  );
}
