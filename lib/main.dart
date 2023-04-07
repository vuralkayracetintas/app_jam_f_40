import 'package:flutter/material.dart';
import 'package:jam_app/pages/home_page.dart';
import 'package:jam_app/pages/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplachScreen(),
    );
  }
}


//todo hero widget ile yazilari tasiyabiliriz 