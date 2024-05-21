import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../base/base_controller.dart';

/// Extension ini digunakan untuk memperluas fungsionalitas dari [BaseController]
extension BaseControllerExtensions on BaseController {
  static final _logger = Get.find<Logger>();

  Logger get logger => _logger;
}
