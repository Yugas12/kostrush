import 'package:kostrushapp/base/base_argument.dart';
import 'package:kostrushapp/data/enum/otp_purpose_enum.dart';

class SuccessArgument extends BaseArguments {
  final OtpPurposeEnum context;
  final String title, description, buttonText;

  SuccessArgument(
      {required this.context,
      required this.title,
      required this.description,
      required this.buttonText});
}
