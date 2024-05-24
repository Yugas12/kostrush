import 'package:get/get.dart';
import 'package:kostrushapp/domain/use_case/app_use_case.dart';

/// Fungsi ini digunakan untuk menginisialisasi modul use case.
/// Pada fungsi ini, sebuah instance dari [ApplicationUseCase] akan diinisialisasi
/// dan di-register menggunakan GetX Dependency Injection.
/// 
/// Contoh penggunaan:
/// ```dart
/// await initUseCaseModule();
/// ```
Future<void> initUseCaseModule() async {
  await Get.putAsync<ApplicationUseCase>(
    () async => ApplicationUseCase(),
  );
}
