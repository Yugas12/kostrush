

import '../network/response/room_response.dart';

class RoomDto {

  final int? id;
  final String? name;
  final int? price;
  final String? facility;
  final String? status;

  RoomDto({
    this.id,
    this.name,
    this.price,
    this.facility,
    this.status,
  });

  factory RoomDto.fromResponse(RoomResponse response) {
    return RoomDto(
      id: int.tryParse(response.id.toString()),
      name: response.name,
      price: int.tryParse(response.price ?? "0"),
      facility: response.facility,
      status: response.status,
    );
  }
}