import 'package:flutter/material.dart';
import 'package:weatherapp/HomePage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _cloudMovement;
  late final Animation<double> _rainDropFall;
  late final Animation<double> _sunFadeIn;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true);

    _cloudMovement = Tween<double>(begin: -40, end: 40)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.linear));
    _rainDropFall = Tween<double>(begin: 0, end: 40)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.linear));
    _sunFadeIn = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 250,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    top: 40,
                    right: screenWidth * 0.6,
                    child: FadeTransition(
                      opacity: _sunFadeIn,
                      child: const Icon(Icons.wb_sunny, size: 120, color: Colors.amber),
                    ),
                  ),
                  for (double i = -40; i <= 40; i += 20)
                    AnimatedBuilder(
                      animation: _rainDropFall,
                      builder: (context, child) {
                        return Positioned(
                          top: 120 + _rainDropFall.value,
                          left: screenWidth / 2.3 + i,
                          child: const Icon(Icons.water_drop, size:25, color: Colors.blue),
                        );
                      },
                    ),
                  Positioned(
                    top: 50,
                    left: screenWidth * 0.3,
                    child: AnimatedBuilder(
                      animation: _cloudMovement,
                      builder: (context, child) {
                        return Transform.translate(
                          offset: Offset(_cloudMovement.value, 0),
                          child: const Icon(Icons.cloud, size: 140, color: Colors.white),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Static Text Widgets
            const Text(
              "Weather",
              style: TextStyle(
                color: Colors.white,
                fontSize: 60,
                fontWeight: FontWeight.bold,
                letterSpacing: 5,
              ),
            ),
            const Text(
              "Forecasts",
              style: TextStyle(
                color: Colors.yellow,
                fontSize: 70,
                fontWeight: FontWeight.bold,
                letterSpacing: 4,
              ),
            ),
            const SizedBox(height: 20),
            // Get Started Button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFFC905),
                minimumSize: Size(screenWidth * 0.75, screenHeight * 0.075),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Homepage()),
                );
              },
              child: const Text(
                "Get Started",
                style: TextStyle(
                  color: Color(0xFF192A3C),
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}