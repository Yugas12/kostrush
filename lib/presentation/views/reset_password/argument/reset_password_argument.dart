import 'package:kostrushapp/base/base_argument.dart';

import '../../../../data/enum/otp_purpose_enum.dart';

class ResetPasswordArgument extends BaseArguments {
  final String email;
  final OtpPurposeEnum context;

  ResetPasswordArgument({required this.email, required this.context});
}
