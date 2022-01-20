import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({Key? key}) : super(key: key);

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  @override
  
  
  /*
  there is two posiblity for running openNExtScreen()
  one is timer
  second is by pressing the view
  if user presed the view it will show main view, after that the timer will not stop , so the timer also will open the main view
  to stop that we wll check if it;s opened before or not*/
  bool isScreenStated = false;
  
  
  // splash screen Will disappear after 4 seconds
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 4), () => openNExtScreen());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ElevatedButton(
          onPressed: () async {
            openNExtScreen();
          },
          style: ElevatedButton.styleFrom(
              onPrimary: Colors.blue,
              onSurface: Colors.red,
              primary: Colors.white,
              shadowColor: Colors.blue),
          child: Column(
            children: [
              Center(
                child: Container(
                    margin: const EdgeInsets.only(
                        top: 80.0, left: 20.0, right: 20.0),
                    child: Lottie.asset('assets/money.json')),
              ),
              SizedBox(
                width: 250.0,
                child: DefaultTextStyle(
                  style: const TextStyle(
                      color: Color.fromARGB(255, 82, 81, 81),
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold),
                  child: AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText('App Name',
                          textAlign: TextAlign.center),
                    ],
                    isRepeatingAnimation: false,
                  ),
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.only(top: 350.0, left: 20.0, right: 20.0),
                child: const Text(
                  'from',
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
      ),
    );
  }

  Future openNExtScreen() async {
    if (!isScreenStated) {
      isScreenStated = true;
      SharedPreferences.getInstance().then((value) {
        if (value.getBool("slpash_") ?? false) {
          Navigator.pushReplacementNamed(context, '/homescreen');
        } else {
          Navigator.pushReplacementNamed(context, '/wellcome01');
        }
      });
    }
  }
}
