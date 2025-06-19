import 'package:flutter/material.dart';
import 'package:proj_visitcard/home.dart';
import 'package:proj_visitcard/qrcodepage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home()
    );
  }
}
