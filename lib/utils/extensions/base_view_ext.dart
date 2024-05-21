import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../base/base_view.dart';

/// Extension ini digunakan untuk memperluas fungsionalitas dari [BaseView]
extension BaseViewExtensions on BaseView {
  /// Membuat [Gap] dengan ukuran default [size] 16
  Widget gap([double size = 16]) => Gap(size);

  static final _logger = Get.find<Logger>();

  /// Mendapatkan instance dari [Logger]
  Logger get logger => _logger;
}
