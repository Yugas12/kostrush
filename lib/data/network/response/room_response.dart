import 'package:json_annotation/json_annotation.dart';

part 'room_response.g.dart';

/// Kelas yang merepresentasikan respons kamar dari server.
@JsonSerializable()
class RoomResponse {
  /// ID kamar.
  @JsonKey(name: 'id_kamar')
  final dynamic id;

  /// Nama kamar.
  @JsonKey(name: 'nama_kamar')
  final String? name;

  /// Harga kamar.
  @JsonKey(name: 'harga')
  final dynamic price;

  /// Fasilitas kamar.
  @JsonKey(name: 'fasilitas')
  final String? facility;

  /// Status kamar.
  @JsonKey(name: 'status_kamar')
  final String? status;

  /// Konstruktor untuk membuat objek RoomResponse.
  RoomResponse({
    this.id,
    this.name,
    this.price,
    this.facility,
    this.status,
  });

  /// Membuat objek RoomResponse dari JSON.
  factory RoomResponse.fromJson(Map<String, dynamic> json) =>
      _$RoomResponseFromJson(json);

  /// Mengonversi objek RoomResponse menjadi JSON.
  Map<String, dynamic> toJson() => _$RoomResponseToJson(this);
}
