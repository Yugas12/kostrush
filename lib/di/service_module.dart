import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:kostrushapp/data/network/service/auth_service.dart';
import 'package:kostrushapp/data/network/service/kost_service.dart';
import 'package:kostrushapp/data/network/service/profile_service.dart';
import 'package:kostrushapp/data/network/service/transaction_service.dart';

/// Inisialisasi modul layanan.
/// Membuat instance dari berbagai layanan yang digunakan dalam aplikasi.
/// 
/// Layanan yang diinisialisasi meliputi:
/// - [AuthService]: Layanan untuk otentikasi pengguna.
/// - [KostService]: Layanan untuk mengakses data kost.
/// - [ProfileService]: Layanan untuk mengakses data profil pengguna.
/// - [TransactionService]: Layanan untuk mengakses data transaksi.
Future<void> initServiceModule() async {
  // Membuat instance AuthService
  await Get.putAsync(() async => AuthService(Get.find<Dio>()));

  // Membuat instance KostService
  await Get.putAsync(() async => KostService(Get.find<Dio>()));

  // Membuat instance ProfileService
  await Get.putAsync(() async => ProfileService(Get.find<Dio>()));

  // Membuat instance ProfileService
  await Get.putAsync(() async => TransactionService(Get.find<Dio>()));
}
