import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../base/base_response.dart';
import '../response/kost_response.dart';

part 'kost_service.g.dart';

@RestApi()
abstract class KostService {
  factory KostService(Dio dio) = _KostService;

  @GET('/api/kost')
  Future<BaseResponse<List<KostResponse>>> getKost({
    @CancelRequest() required CancelToken cancelToken,
  });

  @GET('/api/kost/{id}')
  Future<BaseResponse<KostResponse>> getKostById({
    @CancelRequest() required CancelToken cancelToken,
    @Path('id') required int id,
  });

  @GET('/api/kost/kecamatan')
  Future<BaseResponse<List<KostResponse>>> getKostBySubLocality({
    @CancelRequest() required CancelToken cancelToken,
    @Query('q') required String query,
  });

  @GET('/api/kost/search')
  Future<BaseResponse<List<KostResponse>>> searchKost({
    @CancelRequest() required CancelToken cancelToken,
    @Query('q') required String query,
  });
}
