import 'package:json_annotation/json_annotation.dart';
import 'package:kostrushapp/data/network/response/room_response.dart';

part 'kost_response.g.dart';

/// Kelas yang merepresentasikan respons dari permintaan data kost.
@JsonSerializable()
class KostResponse {
  /// ID dari kost.
  @JsonKey(name: 'id_kost')
  final int? id;

  /// Nama dari kost.
  @JsonKey(name: 'nama_kost')
  final String? name;

  /// Alamat dari kost.
  @JsonKey(name: 'alamat')
  final String? address;

  /// Kecamatan dari kost.
  @JsonKey(name: 'kecamatan')
  final String? subLocality;

  /// Peraturan dari kost.
  @JsonKey(name: 'peraturan')
  final String? rules;

  /// Fasilitas dari kost.
  @JsonKey(name: 'fasilitas')
  final String? facilities;

  /// Tipe dari kost.
  @JsonKey(name: 'tipe')
  final String? type;

  /// Harga terendah dari kost.
  @JsonKey(name: "harga_terendah")
  final String? startPrice;

  /// Harga tertinggi dari kost.
  @JsonKey(name: "harga_tertinggi")
  final String? endPrice;

  /// Daftar kamar yang tersedia di kost.
  @JsonKey(name: 'kamar')
  final List<RoomResponse>? rooms;

  /// Konstruktor untuk membuat objek KostResponse.
  KostResponse({
    this.id,
    this.name,
    this.address,
    this.subLocality,
    this.rules,
    this.facilities,
    this.type,
    this.startPrice,
    this.endPrice,
    this.rooms,
  });

  /// Membuat objek KostResponse dari JSON.
  factory KostResponse.fromJson(Map<String, dynamic> json) =>
      _$KostResponseFromJson(json);

  /// Mengonversi objek KostResponse menjadi JSON.
  Map<String, dynamic> toJson() => _$KostResponseToJson(this);
}
