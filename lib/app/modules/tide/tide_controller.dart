import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_tide_app_cursor/app/data/city_service.dart';
import 'package:getx_tide_app_cursor/app/data/tide_service.dart';

class TideController extends GetxController {
  final CityService cityService;
  final TideService tideService;
  
  late TextEditingController textController;
  List<Map<String, dynamic>> tideData = [];
  bool isLoading = false;
  String error = '';

  TideController({
    required this.cityService,
    required this.tideService,
  });

  @override
  void onInit() {
    super.onInit();
    textController = TextEditingController();
  }

  @override
  void onClose() {
    textController.dispose();
    super.onClose();
  }

  Future<void> fetchTideData(String cityName) async {
    try {
      isLoading = true;
      error = '';
      update();

      final coordinates = await cityService.getCoordinates(cityName);
      final data = await tideService.getTideData(
        coordinates['latitude']!,
        coordinates['longitude']!,
      );
      
      tideData = data;
      isLoading = false;
      update();
    } catch (e) {
      isLoading = false;
      error = e.toString();
      update();
    }
  }
}
