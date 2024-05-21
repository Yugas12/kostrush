import 'package:json_annotation/json_annotation.dart';
import 'package:kostrushapp/data/enum/transaction_status_enum.dart';
import 'package:kostrushapp/data/network/response/profile_response.dart';

import 'kost_response.dart';

part 'transaction_response.g.dart';

@JsonSerializable()
class TransactionResponse {
  @JsonKey(name: 'id_transaksi')
  final int? id;
  @JsonKey(name: 'id_kamar')
  final int? roomId;
  @JsonKey(name: 'nama_kamar')
  final String? roomName;
  @JsonKey(name: 'biaya')
  final int? total;
  @JsonKey(name: 'tanggal_masuk')
  final DateTime? checkIn;
  @JsonKey(name: 'tanggal_keluar')
  final DateTime? checkOut;
  @JsonKey(name: 'durasi')
  final int? duration;
  @JsonKey(name: 'status_transaksi')
  final TransactionStatusEnum? status;

  final ProfileResponse? user;
  final KostResponse? kost;

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

  factory TransactionResponse.fromJson(Map<String, dynamic> json) =>
      _$TransactionResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionResponseToJson(this);
}
