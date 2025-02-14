import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherService {
  Future<Map<String, dynamic>> fetchCurrentWeather() async {
    const String apiKey = "bb0cae202637e279b059eb133515cce8";
    const String city = "saida";
    final Uri url = Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey");

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        return jsonDecode(response.body) as Map<String, dynamic>;
      } else {
        throw Exception("Failed to fetch weather data: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Failed to fetch weather data: $e");
    }
  }
}
