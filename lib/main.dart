import 'package:flutter/material.dart';
import 'package:jam_app/pages/ana_sayfa.dart';
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
        primarySwatch: Colors.purple,
      ),
      home: const SplachScreen(),
    );
  }
}
//todo fab iconlari degisecek web adresine gidecekse web view veya url laucnher kutuphanesi kurulacak entegre edicek
//todo flutter duyurular aciklama sayfasi 
//todo flutter etkinlik sayfasinin acilamalari olsun.





//todo unity etkinlik centik kaldir 
//todo unity duyurular aciklama sayfasi 
//todo unity etkinlik sayfasinin acilamalari olsun.
//todo mentor sayfasi
