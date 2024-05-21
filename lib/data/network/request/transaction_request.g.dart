// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionRequest _$TransactionRequestFromJson(Map<String, dynamic> json) =>
    TransactionRequest(
      kostId: (json['id_kost'] as num).toInt(),
      roomId: (json['id_kamar'] as num).toInt(),
      checkIn: DateTime.parse(json['tanggal_masuk'] as String),
      duration: (json['durasi'] as num).toInt(),
      total: (json['biaya'] as num).toInt(),
    );

Map<String, dynamic> _$TransactionRequestToJson(TransactionRequest instance) =>
    <String, dynamic>{
      'id_kost': instance.kostId,
      'id_kamar': instance.roomId,
      'tanggal_masuk': instance.checkIn.toIso8601String(),
      'durasi': instance.duration,
      'biaya': instance.total,
    };
