import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:kostrushapp/data/local/dao/profile_dao.dart';
import 'package:kostrushapp/data/local/share_pref/storage_preference.dart';
import 'package:kostrushapp/di/repository_module.dart';
import 'package:kostrushapp/di/service_module.dart';
import 'package:kostrushapp/di/use_case_module.dart';
import 'package:kostrushapp/utils/extensions/dio_ext.dart';
import 'package:logger/logger.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:path/path.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:sqflite/sqflite.dart';

/// Fungsi ini digunakan untuk inisialisasi modul aplikasi dengan konsep dependency injection
Future<void> initApplicationModule() async {
  // Membuat instance Logger
  await Get.putAsync<Logger>(
    () async => Logger(),
  );

  // Membuat instance FlutterSecureStorage
  await Get.putAsync(() async => const FlutterSecureStorage());

  // Membuat instance StoragePreference
  await Get.putAsync(
    () async => StoragePreference(
      Get.find<FlutterSecureStorage>(),
      Get.find<Logger>(),
    ),
  );

  // Membuat instance PackageInfo
  await Get.putAsync(() async => PackageInfo.fromPlatform());

  // Membuat instance Dio untuk melakukan request ke server
  await Get.putAsync(
    () async => Dio()

        /// Ubah baseUrl sesuai dengan alamat server
        .addBaseUrl("https://29b7-103-228-246-246.ngrok-free.app")
        .addInterceptor(
          PrettyDioLogger(
            request: true,
            requestHeader: true,
            requestBody: true,
            compact: false,
            maxWidth: 300,
            responseHeader: true,
            responseBody: true,
          ),
        ),
  );

  // Membuat instance Database
  await Get.putAsync<Database>(
    () async => openDatabase(
      join(
        await getDatabasesPath(),
        'kostrushapp.db',
      ),
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE users(id INTEGER PRIMARY KEY, name TEXT, email TEXT, address TEXT, dateBirth INTEGER, photo TEXT, phoneNumber TEXT, gender TEXT, occupation TEXT)",
        );
      },
      version: 2,
    ),
  );

  // Membuat instance ProfileDao
  await Get.putAsync(
    () async => ProfileDao(
      Get.find(),
    ),
  );

  await initServiceModule();
  await initRepositoryModule();
  await initUseCaseModule();
}
