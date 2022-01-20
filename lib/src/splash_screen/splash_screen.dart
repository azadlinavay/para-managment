import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../welcome_screens/welcome_screens01.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({Key? key}) : super(key: key);

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  @override

  // splash screen Will disappear after 5 seconds
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 10),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const SplashScreenView())));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Center(
              child: Container(
                  margin:
                      const EdgeInsets.only(top: 80.0, left: 20.0, right: 20.0),
                  child: Lottie.asset('assets/money.json')),
            ),
            TextLiquidFill(
              boxHeight: 50,
              boxWidth: 300,
              text: 'App Name',
              waveDuration: Duration(seconds: 3),
              waveColor: Colors.blue,
              textStyle: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              margin:
                  const EdgeInsets.only(top: 350.0, left: 20.0, right: 20.0),
              child: const Text(
                'From',
                style: TextStyle(fontSize: 15),
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Image.asset(
                  'images/rwanga_logo.png',
                  height: 60,
                ))
          ],
        ),
      ),
    );
  }
}
