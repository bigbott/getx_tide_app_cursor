import 'package:get/get.dart';
import 'package:getx_tide_app_cursor/app/data/appwrite_function/tide_function_service.dart';

import 'tide_function_controller.dart';

class TideFunctionBinding extends Bindings {
  @override
  void dependencies() {
    TideFunctionService.putInstance();
    Get.lazyPut<TideFunctionController>(
      () => TideFunctionController(tideFunctionService: Get.find<TideFunctionService>()),
    );
  }
}
