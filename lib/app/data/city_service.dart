import 'package:dio/dio.dart';

class CityService {
  static const API_KEY = "I5lrzIbElCk65JfyystGEg==LMPVliDZuS6wiuni";
  static const URL = "https://api.api-ninjas.com/v1/geocoding?city=";
  
  final _dio = Dio();

  Future<Map<String, double>> getCoordinates(String cityName) async {
    try {
      final response = await _dio.get(
        '$URL$cityName',
        options: Options(
          headers: {'X-Api-Key': API_KEY},
        ),
      );

      if (response.data is List && response.data.isNotEmpty) {
        final data = response.data[0];
        print( data['latitude']);
        print( data['longitude']);
        return {
          'latitude': data['latitude'],
          'longitude': data['longitude'],
        };
      }
      throw Exception('City not found');
    } catch (e) {
      throw Exception('Failed to get coordinates: $e');
    }
  }
}