import 'package:json_annotation/json_annotation.dart';

part 'transaction_request.g.dart';

/// Kelas yang merepresentasikan permintaan transaksi.
@JsonSerializable()
class TransactionRequest {
  /// ID kost.
  @JsonKey(name: 'id_kost')
  final int kostId;

  /// ID kamar.
  @JsonKey(name: 'id_kamar')
  final int roomId;

  /// Tanggal check-in.
  @JsonKey(name: 'tanggal_masuk')
  final DateTime checkIn;

  /// Durasi tinggal.
  @JsonKey(name: 'durasi')
  final int duration;

  /// Total biaya.
  @JsonKey(name: 'biaya')
  final int total;

  /// Konstruktor TransactionRequest.
  TransactionRequest({
    required this.kostId,
    required this.roomId,
    required this.checkIn,
    required this.duration,
    required this.total,
  });

  /// Membuat objek TransactionRequest dari JSON.
  factory TransactionRequest.fromJson(Map<String, dynamic> json) =>
      _$TransactionRequestFromJson(json);

  /// Mengonversi objek TransactionRequest menjadi JSON.
  Map<String, dynamic> toJson() => _$TransactionRequestToJson(this);
}
