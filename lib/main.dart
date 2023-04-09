import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:flutter/material.dart';
import 'package:jam_app/firebase_options.dart';
import 'package:jam_app/pages/ana_sayfa.dart';
import 'package:jam_app/pages/service/firebase_notification_service.dart';
import 'package:jam_app/pages/service/local_notification_service.dart';
import 'package:jam_app/pages/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseMessaging.onBackgroundMessage(
      FirebaseNotificationService.backgroundMessage);
  LocalNotificationServices.initialize();
  //FirebaseMessaging.instance.getInitialMessage();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.purple),
      home: const SplachScreen(),
    );
  }
}
