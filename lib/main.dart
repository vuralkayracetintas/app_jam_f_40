import 'package:flutter/material.dart';
import 'package:jam_app/pages/ana_sayfa.dart';
import 'package:jam_app/pages/home_page.dart';
import 'package:jam_app/pages/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isDarkModeEnabled = false;

  void toggleTheme() {
    setState(() {
      _isDarkModeEnabled = !_isDarkModeEnabled;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: _isDarkModeEnabled ? ThemeData.dark() : ThemeData.light(),
      home: const Ana_sayfa(),
    );
  }
}
//todo flutter etkinlik sayfasinin acilamalari olsun.

//todo unity etkinlik sayfasinin acilamalari olsun.

//todo mentor sayfasi
