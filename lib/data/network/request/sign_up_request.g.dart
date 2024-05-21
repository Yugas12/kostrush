// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpRequest _$SignUpRequestFromJson(Map<String, dynamic> json) =>
    SignUpRequest(
      email: json['email'] as String,
      password: json['password'] as String,
      name: json['name'] as String,
      phone: json['no_hp'] as String,
      address: json['alamat'] as String,
      occupation: json['pekerjaan'] as String,
      dateBirth: DateTime.parse(json['tgl_lahir'] as String),
      gender: $enumDecode(_$GenderEnumEnumMap, json['jenis_kelamin']),
    );

Map<String, dynamic> _$SignUpRequestToJson(SignUpRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'name': instance.name,
      'no_hp': instance.phone,
      'alamat': instance.address,
      'pekerjaan': instance.occupation,
      'tgl_lahir': instance.dateBirth.toIso8601String(),
      'jenis_kelamin': _$GenderEnumEnumMap[instance.gender]!,
    };

const _$GenderEnumEnumMap = {
  GenderEnum.Male: 'laki-laki',
  GenderEnum.Female: 'perempuan',
};
