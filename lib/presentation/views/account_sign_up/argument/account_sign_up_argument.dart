import 'package:kostrushapp/base/base_argument.dart';

class AccountSignUpArgument extends BaseArguments {
  AccountSignUpArgument({
    required this.name,
    required this.phoneNumber,
    this.occupation,
    this.address,
  });

  final String name, phoneNumber;
  final String? occupation, address;
}
