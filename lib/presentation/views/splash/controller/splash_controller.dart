import 'package:get/get.dart';
import 'package:kostrushapp/base/base_argument.dart';
import 'package:kostrushapp/base/base_state.dart';
import 'package:kostrushapp/domain/use_case/app_use_case.dart';
import 'package:kostrushapp/res/routes/app_routes.dart';
import 'package:kostrushapp/utils/extensions/base_controller_ext.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../../../base/base_controller.dart';

class SplashController extends BaseController<NoArguments, NoState> {
  final _appUseCase = Get.find<ApplicationUseCase>();

  RxnString appVersion = RxnString(null);

  final packageInfo = Get.find<PackageInfo>();

  @override
  void initComponent() {}

  @override
  void onObserve() {
    _startSplash();
  }

  @override
  Future<void> onProcess() async {
    appVersion.value = packageInfo.version;
  }

  @override
  void disposeComponent() {
    appVersion.value = null;
    appVersion.close();
  }

  Future<void> _startSplash() async {
    final bool isSignIn = await _appUseCase.isUserLoggedIn();
    await Future.delayed(
      const Duration(
        seconds: 3,
      ),
    );

    logger.d("isSignIn: $isSignIn");

    if (isSignIn) {
      Get.offNamed(AppRoutes.main);
    } else {
      Get.offNamed(AppRoutes.signIn);
    }
  }
}
