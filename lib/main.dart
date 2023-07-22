import 'package:flutter/material.dart';
import 'package:shared_pref/Login_Screen.dart';
import 'package:shared_pref/Splash_Screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Splash_Screen(),
    );
  }
}

