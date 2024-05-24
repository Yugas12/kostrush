import 'package:get/get.dart';

import '../controller/splash_controller.dart';

/// Kelas `SplashBinding` adalah kelas yang mengikat dependensi untuk tampilan Splash.
class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(() => SplashController());
  }
}
