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
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.center,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF192A3C), Colors.purple],
          ),
        ),
      ),
    );
  }
}
