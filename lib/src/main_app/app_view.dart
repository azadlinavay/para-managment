import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AppView extends StatelessWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: Lottie.asset('assets/money.json'),
      ),
    );
  }
}
