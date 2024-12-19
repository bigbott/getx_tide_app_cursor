import 'package:get/get.dart';


import '../modules/tide/tide_binding.dart';
import '../modules/tide/tide_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.TIDE;

  static final routes = [

    GetPage(
      name: _Paths.TIDE,
      page: () => TideView(),
      binding: TideBinding(),
    ),
  ];
}
