import 'package:json_annotation/json_annotation.dart';
import 'package:kostrushapp/data/enum/transaction_status_enum.dart';
import 'package:kostrushapp/data/network/response/profile_response.dart';

import 'kost_response.dart';

part 'transaction_response.g.dart';

/// Kelas yang merepresentasikan respons transaksi.
@JsonSerializable()
class TransactionResponse {
  /// ID transaksi.
  @JsonKey(name: 'id_transaksi')
  final int? id;

  /// ID kamar.
  @JsonKey(name: 'id_kamar')
  final int? roomId;

  /// Nama kamar.
  @JsonKey(name: 'nama_kamar')
  final String? roomName;

  /// Biaya transaksi.
  @JsonKey(name: 'biaya')
  final String? total;

  /// Tanggal check-in.
  @JsonKey(name: 'tanggal_masuk')
  final DateTime? checkIn;

  /// Tanggal check-out.
  @JsonKey(name: 'tanggal_keluar')
  final DateTime? checkOut;

  /// Durasi transaksi.
  @JsonKey(name: 'durasi')
  final int? duration;

  /// Status transaksi.
  @JsonKey(name: 'status_transaksi')
  final TransactionStatusEnum? status;

  /// Respons profil pengguna.
  final ProfileResponse? user;

  /// Respons kost.
  final KostResponse? kost;

  /// Konstruktor TransactionResponse.
  TransactionResponse({
    this.id,
    this.roomId,
    this.roomName,
    this.total,
    this.checkIn,
    this.checkOut,
    this.duration,
    this.status,
    this.user,
    this.kost,
  });

  /// Membuat objek TransactionResponse dari JSON.
  factory TransactionResponse.fromJson(Map<String, dynamic> json) =>
      _$TransactionResponseFromJson(json);

  /// Mengonversi objek TransactionResponse menjadi JSON.
  Map<String, dynamic> toJson() => _$TransactionResponseToJson(this);
}
