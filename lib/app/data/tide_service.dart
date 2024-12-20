import 'package:dio/dio.dart';

class TideService {
  static const API_KEY = "get your API key";
  static const URL = "https://api.stormglass.io/v2/tide/extremes/point";
  
  final _dio = Dio();

  Future<List<Map<String, dynamic>>> getTideData(double lat, double lng) async {
    try {
      final response = await _dio.get(
        URL,
        queryParameters: {
          'lat': lat,
          'lng': lng,
          'start': DateTime.now().toIso8601String(),
          'end': DateTime.now().add(Duration(days: 2)).toIso8601String(),
        },
        options: Options(
          headers: {'Authorization': API_KEY},
          validateStatus: (status) => status! < 500,
        ),
      );

      if (response.statusCode == 200) {
        if (response.data['data'] != null) {
          return List<Map<String, dynamic>>.from(response.data['data']);
        }
        throw Exception('No tide data available for this location');
      } else if (response.statusCode == 401) {
        throw Exception('Invalid API key');
      } else if (response.statusCode == 429) {
        throw Exception('API rate limit exceeded');
      } else {
        throw Exception('Failed to get tide data: ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw Exception('Network error: ${e.message}');
    } catch (e) {
      throw Exception('Failed to get tide data: $e');
    }
  }
}
