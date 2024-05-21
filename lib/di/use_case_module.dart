import 'package:get/get.dart';
import 'package:kostrushapp/domain/use_case/app_use_case.dart';

Future<void> initUseCaseModule() async {
  await Get.putAsync<ApplicationUseCase>(
    () async => ApplicationUseCase(),
  );
}
