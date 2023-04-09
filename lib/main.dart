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
      theme: ThemeData(primarySwatch: Colors.purple),
      home: const SplachScreen(),
    );
  }
}
//todo gorevler duyurular etkinlikler sayfasindaki container renkleri degisecek unity ve 
//genel duyurular
//todo  unity etkinlik sayfasi tasarimi degisecek 
// todo yildizlari ayarlar
//todo genel etkinlik appbar rengi degisecek 
// todo genel etkinlik sayfa duzeni degisecek

