// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionResponse _$TransactionResponseFromJson(Map<String, dynamic> json) =>
    TransactionResponse(
      id: json['id_transaksi'],
      roomId: json['id_kamar'],
      roomName: json['nama_kamar'] as String?,
      total: json['biaya'] as String?,
      checkIn: json['tanggal_masuk'] == null
          ? null
          : DateTime.parse(json['tanggal_masuk'] as String),
      checkOut: json['tanggal_keluar'] == null
          ? null
          : DateTime.parse(json['tanggal_keluar'] as String),
      duration: json['durasi'],
      status: $enumDecodeNullable(
          _$TransactionStatusEnumEnumMap, json['status_transaksi']),
      user: json['user'] == null
          ? null
          : ProfileResponse.fromJson(json['user'] as Map<String, dynamic>),
      kost: json['kost'] == null
          ? null
          : KostResponse.fromJson(json['kost'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TransactionResponseToJson(
        TransactionResponse instance) =>
    <String, dynamic>{
      'id_transaksi': instance.id,
      'id_kamar': instance.roomId,
      'nama_kamar': instance.roomName,
      'biaya': instance.total,
      'tanggal_masuk': instance.checkIn?.toIso8601String(),
      'tanggal_keluar': instance.checkOut?.toIso8601String(),
      'durasi': instance.duration,
      'status_transaksi': _$TransactionStatusEnumEnumMap[instance.status],
      'user': instance.user,
      'kost': instance.kost,
    };

const _$TransactionStatusEnumEnumMap = {
  TransactionStatusEnum.pending: 'menunggu',
  TransactionStatusEnum.processing: 'diproses',
  TransactionStatusEnum.done: 'selesai',
};
