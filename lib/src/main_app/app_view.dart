import 'package:flutter/material.dart';

import '../splash_screen/splash_screen.dart';

class AppView extends StatelessWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Color.fromARGB(255, 255, 253, 253),
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.transparent,
          )),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreenView(), //this was the Auth handler
      },
    );
  }
}
