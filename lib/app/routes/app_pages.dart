import 'package:get/get.dart';

import '../modules/tide/tide_binding.dart';
import '../modules/tide/tide_view.dart';
import '../modules/tide_function/tide_function_binding.dart';
import '../modules/tide_function/tide_function_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.TIDE_FUNCTION;

  static final routes = [
    GetPage(
      name: _Paths.TIDE,
      page: () => TideView(),
      binding: TideBinding(),
    ),
    GetPage(
      name: _Paths.TIDE_FUNCTION,
      page: () => const TideFunctionView(),
      binding: TideFunctionBinding(),
    ),
  ];
}
