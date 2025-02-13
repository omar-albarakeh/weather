import 'package:flutter/material.dart';

class splashscreen extends StatefulWidget {
  const splashscreen({super.key});

  @override
  State<splashscreen> createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.center,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF192A3C), Colors.purple],
        ),
      ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Weather",style: TextStyle(color: Colors.yellow,fontSize: 80,fontWeight: FontWeight.bold),),
              Text("Forecasts",style: TextStyle(color: Colors.white,fontSize: 80,fontWeight: FontWeight.bold))
            ],
          ),
    ));
  }
}
