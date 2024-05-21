// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kost_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KostResponse _$KostResponseFromJson(Map<String, dynamic> json) => KostResponse(
      id: (json['id_kost'] as num?)?.toInt(),
      name: json['nama_kost'] as String?,
      address: json['alamat'] as String?,
      subLocality: json['kecamatan'] as String?,
      rules: json['peraturan'] as String?,
      facilities: json['fasilitas'] as String?,
      type: json['tipe'] as String?,
      startPrice: (json['harga_terendah'] as num?)?.toInt(),
      endPrice: (json['harga_tertinggi'] as num?)?.toInt(),
    );

Map<String, dynamic> _$KostResponseToJson(KostResponse instance) =>
    <String, dynamic>{
      'id_kost': instance.id,
      'nama_kost': instance.name,
      'alamat': instance.address,
      'kecamatan': instance.subLocality,
      'peraturan': instance.rules,
      'fasilitas': instance.facilities,
      'tipe': instance.type,
      'harga_terendah': instance.startPrice,
      'harga_tertinggi': instance.endPrice,
    };
