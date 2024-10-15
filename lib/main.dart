import 'package:flutter/material.dart';
import 'package:goverment_app_ui/All_IN_ONE/home.dart';
import 'package:goverment_app_ui/Internet_contevity/internet.dart';
import 'package:goverment_app_ui/google_dumy_ui_dart/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

