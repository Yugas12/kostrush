import 'package:json_annotation/json_annotation.dart';

part 'transaction_request.g.dart';

@JsonSerializable()
class TransactionRequest {
  @JsonKey(name: 'id_kost')
  final int kostId;
  @JsonKey(name: 'id_kamar')
  final int roomId;
  @JsonKey(name: 'tanggal_masuk')
  final DateTime checkIn;
  @JsonKey(name: 'durasi')
  final int duration;
  @JsonKey(name: 'biaya')
  final int total;

  TransactionRequest({
    required this.kostId,
    required this.roomId,
    required this.checkIn,
    required this.duration,
    required this.total,
  });

  factory TransactionRequest.fromJson(Map<String, dynamic> json) =>
      _$TransactionRequestFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionRequestToJson(this);
}
