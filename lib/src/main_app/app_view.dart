import 'package:flutter/material.dart';
import 'package:para/src/welcome_screens/welcome_screens01.dart';
import 'package:para/src/welcome_screens/welcome_screens02.dart';
import 'package:para/src/welcome_screens/welcome_screens03.dart';

import '../home_screen/home_screen.dart';
import '../splash_screen/splash_screen.dart';

class AppView extends StatelessWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Color.fromARGB(255, 255, 253, 253),
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.transparent,
          )),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreenView(),
        '/homescreen': (context) => HomeScreenView(),
        '/wellcome01': (context) => WelcomeScreenView01(),
        '/wellcome02': (context) => WelcomeScreenView02(),
        '/wellcome03': (context) => WelcomeScreenView03(),
        //this was the Auth handler
        //this was the Auth handler
        //this was the Auth handler
      },
    );
  }
}
