import 'dorm_bath_model.dart';
import 'dorm_policy_model.dart';
import 'dorm_specification_model.dart';

class DormModel {
  final String name;
  final String address;
  final String phone;
  final List<String> images;
  final String description;
  final String price;
  final DormSpecificationModel specification;
  final DormBathModel bath;
  final DormPolicyModel policy;

  DormModel({
    required this.name,
    required this.address,
    required this.phone,
    required this.images,
    required this.description,
    required this.price,
    required this.specification,
    required this.bath,
    required this.policy,
  });
}
