// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoomResponse _$RoomResponseFromJson(Map<String, dynamic> json) => RoomResponse(
      id: json['id_kamar'],
      name: json['nama_kamar'] as String?,
      price: json['harga'],
      facility: json['fasilitas'] as String?,
      status: json['status_kamar'] as String?,
    );

Map<String, dynamic> _$RoomResponseToJson(RoomResponse instance) =>
    <String, dynamic>{
      'id_kamar': instance.id,
      'nama_kamar': instance.name,
      'harga': instance.price,
      'fasilitas': instance.facility,
      'status_kamar': instance.status,
    };
