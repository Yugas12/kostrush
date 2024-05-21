import 'package:dio/dio.dart';

extension DioExtension on Dio {
  Dio addBaseUrl(String baseUrl) {
    options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(minutes: 5),
      receiveTimeout: const Duration(minutes: 5),
    );
    return this;
  }

  Dio addInterceptor(Interceptor interceptor) {
    interceptors.add(interceptor);
    return this;
  }
}
