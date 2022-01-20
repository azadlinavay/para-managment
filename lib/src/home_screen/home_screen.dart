import 'package:flutter/material.dart';
import 'package:para/src/temp/damy_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreenView extends StatefulWidget {
  HomeScreenView({Key? key}) : super(key: key);

  @override
  _HomeScreenViewState createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends State<HomeScreenView> {
  @override
  void initState() {
    super.initState();
    //save that the aplash is viewd, to not shoed again.
    SharedPreferences.getInstance()
        .then((value) => value.setBool("slpash_", true));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Para Managment"),
      ),
      body: SafeArea(
        child: Center(
            child: Container(
          child: const Text("Main View"),
        )),
      ),
    );
  }
}
