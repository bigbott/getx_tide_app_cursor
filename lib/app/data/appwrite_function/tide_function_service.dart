import 'dart:convert';

import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:get/get.dart';
import 'package:getx_tide_app_cursor/app/data/appwrite_function/appwrite.dart';
import 'package:getx_tide_app_cursor/app/data/appwrite_function/secret_constants.dart';

class TideFunctionService extends GetxService {
  static putInstance() =>
      Get.put<TideFunctionService>(TideFunctionService(), permanent: true);

  Future<List<Map<String, dynamic>>> getTideData(String cityName) async {
    try {
      String json = '{"cityName": "$cityName"}';
      final execution = await appwrite.functions.createExecution(
          functionId: SecretConstants.APPWRITE_FUNCTION_ID, body: json);

      print('execution.status: ${execution.status}');
      print('execution.response: ${execution.responseBody}');
      //return execution.toMap();
      var listOfDynamics = jsonDecode(execution.responseBody) as List<dynamic>;
      var listOfMaps = listOfDynamics
          .map((element) => element as Map<String, dynamic>)
          .toList();
      return listOfMaps;
    } on AppwriteException catch (e) {
      print(e.message);
      throw Exception(e);
    }
  }
}
