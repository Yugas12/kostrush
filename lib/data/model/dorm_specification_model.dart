import 'package:kostrushapp/data/enum/dorm_bath_enum.dart';

class DormSpecificationModel {
  String space;
  bool airConditioner;
  bool bed;
  bool pillow;
  DormBathEnum bath;

  DormSpecificationModel({
    required this.space,
    required this.airConditioner,
    required this.bath,
    this.bed = true,
    this.pillow = true,
  });
}
