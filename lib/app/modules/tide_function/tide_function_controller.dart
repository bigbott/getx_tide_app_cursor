import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_tide_app_cursor/app/data/appwrite_function/tide_function_service.dart';

class TideFunctionController extends GetxController {
  final TideFunctionService tideFunctionService;
  
  late TextEditingController textController;
  List<Map<String, dynamic>> tideData = [];
  bool isLoading = false;
  String error = '';

  TideFunctionController({
    required this.tideFunctionService,
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
      final data = await tideFunctionService.getTideData(cityName);
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
