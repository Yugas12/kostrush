import 'dart:io';

import 'package:dio/dio.dart';
import 'package:kostrushapp/data/network/request/transaction_request.dart';
import 'package:kostrushapp/data/network/response/profile_response.dart';
import 'package:retrofit/retrofit.dart';

import '../../../base/base_response.dart';
import '../response/transaction_response.dart';

part 'transaction_service.g.dart';

/// Layanan untuk mengakses API transaksi.
@RestApi()
abstract class TransactionService {
  factory TransactionService(Dio dio) = _TransactionService;

  /// Mendapatkan daftar transaksi.
  ///
  /// [cancelToken] - Token pembatalan untuk membatalkan permintaan.
  /// [token] - Token otorisasi yang diperlukan untuk mengakses API.
  ///
  /// Mengembalikan [Future] yang berisi [BaseResponse] yang berisi daftar [TransactionResponse].
  @GET('/api/transaction')
  Future<BaseResponse<List<TransactionResponse>>> getTransaction({
    @CancelRequest() required CancelToken cancelToken,
    @Header('Authorization') required String token,
  });

  /// Mendapatkan detail transaksi berdasarkan ID.
  ///
  /// [cancelToken] - Token pembatalan untuk membatalkan permintaan.
  /// [token] - Token otorisasi yang diperlukan untuk mengakses API.
  /// [id] - ID transaksi yang ingin diperoleh detailnya.
  ///
  /// Mengembalikan [Future] yang berisi [BaseResponse] yang berisi [TransactionResponse].
  @GET('/api/transaction/{id}')
  Future<BaseResponse<TransactionResponse>> getTransactionById({
    @CancelRequest() required CancelToken cancelToken,
    @Header('Authorization') required String token,
    @Path('id') required int id,
  });

  /// Membuat transaksi baru.
  ///
  /// [cancelToken] - Token pembatalan untuk membatalkan permintaan.
  /// [token] - Token otorisasi yang diperlukan untuk mengakses API.
  /// [request] - Data permintaan untuk membuat transaksi.
  ///
  /// Mengembalikan [Future] yang berisi [BaseResponse] yang berisi [TransactionResponse].
  @POST('/api/transaction')
  Future<BaseResponse<TransactionResponse>> createTransaction({
    @CancelRequest() required CancelToken cancelToken,
    @Header('Authorization') required String token,
    @Body() required TransactionRequest request,
  });

  /// Mengunggah dokumen transaksi.
  ///
  /// [cancelToken] - Token pembatalan untuk membatalkan permintaan.
  /// [token] - Token otorisasi yang diperlukan untuk mengakses API.
  /// [file] - File yang akan diunggah.
  ///
  /// Mengembalikan [Future] yang berisi [BaseResponse] yang berisi [ProfileResponse].
  @POST('/api/transaction/docs')
  Future<BaseResponse<ProfileResponse>> uploadDocument({
    @CancelRequest() required CancelToken cancelToken,
    @Header('Authorization') required String token,
    @Part(name: "file") required File file,
  });
}
