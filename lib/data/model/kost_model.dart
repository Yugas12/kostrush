import 'package:kostrushapp/data/network/response/kost_response.dart';
import 'package:kostrushapp/data/network/response/room_response.dart';

class KostModel {
  final int? id;

  final String? name;

  final String? address;

  final String? subLocality;

  final String? rules;

  final String? facilities;

  final String? type;

  final int? startPrice;

  final int? endPrice;

  final List<RoomResponse>? rooms;

  KostModel({
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

  factory KostModel.fromResponse(KostResponse response) {
    return KostModel(
      id: int.tryParse(response.id.toString()),
      name: response.name,
      address: response.address,
      subLocality: response.subLocality,
      rules: response.rules,
      facilities: response.facilities,
      type: response.type,
      startPrice: int.tryParse(response.startPrice ?? "0"),
      endPrice: int.tryParse(response.endPrice ?? "0"),
      rooms: response.rooms,
    );
  }

}
