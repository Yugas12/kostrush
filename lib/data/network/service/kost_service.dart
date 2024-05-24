import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../base/base_response.dart';
import '../response/kost_response.dart';

part 'kost_service.g.dart';

/// Layanan untuk mengakses API Kost.
@RestApi()
abstract class KostService {
  factory KostService(Dio dio) = _KostService;

  /// Mengambil daftar Kost.
  ///
  /// [cancelToken] - Token pembatalan untuk membatalkan permintaan.
  @GET('/api/kost')
  Future<BaseResponse<List<KostResponse>>> getKost({
    @CancelRequest() required CancelToken cancelToken,
  });

  /// Mengambil detail Kost berdasarkan ID.
  ///
  /// [cancelToken] - Token pembatalan untuk membatalkan permintaan.
  /// [id] - ID Kost yang ingin diambil.
  @GET('/api/kost/{id}')
  Future<BaseResponse<KostResponse>> getKostById({
    @CancelRequest() required CancelToken cancelToken,
    @Path('id') required int id,
  });

  /// Mengambil daftar Kost berdasarkan sub-lokasi.
  ///
  /// [cancelToken] - Token pembatalan untuk membatalkan permintaan.
  /// [query] - Query untuk mencari sub-lokasi.
  @GET('/api/kost/kecamatan')
  Future<BaseResponse<List<KostResponse>>> getKostBySubLocality({
    @CancelRequest() required CancelToken cancelToken,
    @Query('q') required String query,
  });

  /// Mencari Kost berdasarkan query.
  ///
  /// [cancelToken] - Token pembatalan untuk membatalkan permintaan.
  /// [query] - Query untuk mencari Kost.
  @GET('/api/kost/search')
  Future<BaseResponse<List<KostResponse>>> searchKost({
    @CancelRequest() required CancelToken cancelToken,
    @Query('q') required String query,
  });
}
