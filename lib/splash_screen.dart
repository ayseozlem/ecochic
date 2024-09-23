import 'package:flutter/material.dart';
import 'dart:async';
import 'main.dart'; // Ana sayfa dosyanızın doğru yolu

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => HomePage()) // Ana sayfaya geçiş
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFCE4DE),

      body: Center(
        child: Image.asset(
            'assets/images/ecochic.png',
          fit: BoxFit.contain,
          height: double.infinity,
          width: double.infinity,
        ),

      ),
    );
  }
}
