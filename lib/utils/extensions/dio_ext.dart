import 'package:dio/dio.dart';

extension DioExtension on Dio {
  /// Menambahkan base URL ke instance Dio.
  ///
  /// [baseUrl] adalah URL dasar yang akan ditambahkan ke instance Dio.
  /// [connectTimeout] adalah waktu maksimum yang diperbolehkan untuk melakukan koneksi ke server.
  /// [receiveTimeout] adalah waktu maksimum yang diperbolehkan untuk menerima respons dari server.
  ///
  /// Mengembalikan instance Dio yang telah ditambahkan base URL-nya.
  Dio addBaseUrl(String baseUrl) {
    options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(minutes: 5),
      receiveTimeout: const Duration(minutes: 5),
    );
    return this;
  }

  /// Menambahkan interceptor ke objek Dio.
  ///
  /// [interceptor] Interceptor yang akan ditambahkan.
  ///
  /// Returns Dio object dengan interceptor yang ditambahkan.
  Dio addInterceptor(Interceptor interceptor) {
    interceptors.add(interceptor);
    return this;
  }
}
