import 'package:flutter/material.dart';

class NoFocusNode extends FocusNode {
  @override
  bool get canRequestFocus => false;
}
