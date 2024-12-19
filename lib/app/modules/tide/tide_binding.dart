import 'package:get/get.dart';
import 'package:getx_tide_app_cursor/app/data/city_service.dart';
import 'package:getx_tide_app_cursor/app/data/tide_service.dart';
import 'tide_controller.dart';

class TideBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CityService());
    Get.lazyPut(() => TideService());
    Get.lazyPut<TideController>(
      () => TideController(
        cityService: Get.find<CityService>(),
        tideService: Get.find<TideService>(),
      ),
    );
  }
}
