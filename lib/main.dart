import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:para/src/main_app/app_view.dart';
import 'package:para/src/temp/damy_data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) => debugPrint("firebase done"));

  saveDataToFierbase();

  runApp(const AppView());
}
