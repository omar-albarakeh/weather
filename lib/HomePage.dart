import 'package:flutter/material.dart';
import 'package:weatherapp/weatherService.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final WeatherService weatherService = WeatherService();
  Map<String, dynamic>? weatherData;

  @override
  void initState() {
    super.initState();
    _loadWeather();
  }

  Future<void> _loadWeather() async{
    try{
      final data = await weatherService.fetchCurrentWeather();
      setState(() {
        weatherData =data;
      });
    }
    catch (e) {
      debugPrint("Error fetching weather data: $e");
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image:DecorationImage(
        image:AssetImage("lib/assets/images/cloudy.jpeg"),
            fit: BoxFit.cover
          )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            weatherData == null
                ? const CircularProgressIndicator()
                : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Temperature: ${(weatherData!['main']['temp'] - 273.15).floor()}°C",
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                ),
                Text(
                  "City: ${weatherData!['name']}",
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}