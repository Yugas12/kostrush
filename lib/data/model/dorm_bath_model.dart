import 'package:kostrushapp/data/enum/dorm_toilet_enum.dart';

class DormBathModel {
  final DormToiletEnum toilet;
  final bool washingMachine;
  final bool shower;
  final bool bathtub;
  final bool hotWater;
  final bool sink;

  DormBathModel({
    required this.toilet,
    this.washingMachine = false,
    this.shower = false,
    this.bathtub = false,
    this.hotWater = false,
    this.sink = false,
  });
}
