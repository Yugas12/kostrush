import 'package:kostrushapp/base/base_argument.dart';
import 'package:kostrushapp/data/enum/otp_purpose_enum.dart';

class ChangePasswordArgument extends BaseArguments {
  final String email;
  final OtpPurposeEnum context;

  ChangePasswordArgument({
    required this.email,
    this.context = OtpPurposeEnum.changePassword,
  });
}
