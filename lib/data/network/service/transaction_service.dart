import 'dart:io';

import 'package:dio/dio.dart';
import 'package:kostrushapp/data/network/request/transaction_request.dart';
import 'package:kostrushapp/data/network/response/profile_response.dart';
import 'package:retrofit/retrofit.dart';

import '../../../base/base_response.dart';
import '../response/transaction_response.dart';

part 'transaction_service.g.dart';

@RestApi()
abstract class TransactionService {
  factory TransactionService(Dio dio) = _TransactionService;

  @GET('/api/transaction')
  Future<BaseResponse<List<TransactionResponse>>> getTransaction({
    @CancelRequest() required CancelToken cancelToken,
    @Header('Authorization') required String token,
  });

  @GET('/api/transaction/{id}')
  Future<BaseResponse<TransactionResponse>> getTransactionById({
    @CancelRequest() required CancelToken cancelToken,
    @Header('Authorization') required String token,
    @Path('id') required int id,
  });

  @POST('/api/transaction')
  Future<BaseResponse<TransactionResponse>> createTransaction({
    @CancelRequest() required CancelToken cancelToken,
    @Header('Authorization') required String token,
    @Body() required TransactionRequest request,
  });

  @POST('/api/transaction/docs')
  Future<BaseResponse<ProfileResponse>> uploadDocument({
    @CancelRequest() required CancelToken cancelToken,
    @Header('Authorization') required String token,
    @Part(name: "file") required File file,
  });
}
