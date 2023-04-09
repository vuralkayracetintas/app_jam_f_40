import 'dart:developer';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:jam_app/pages/service/local_notification_service.dart';

class FirebaseNotificationService {
  late final FirebaseMessaging messaging;

  void settingNotification() async {
    await messaging.requestPermission(
      alert: true,
      sound: true,
      badge: true,
    );
  }

  void connectionNotification() async {
    await Firebase.initializeApp();
    messaging = FirebaseMessaging.instance;

    messaging.setForegroundNotificationPresentationOptions(
      alert: true,
      sound: true,
      badge: true,
    );

    settingNotification();
    FirebaseMessaging.instance.setAutoInitEnabled(true);
    FirebaseMessaging.onMessage.listen(
      (RemoteMessage message) {
        print('Message also contained a notification: ${message.notification}');
        print('gelen bildirim basligi : ${message.notification?.title}');
        print('message title : ${message.notification?.body}');
        if (message.notification != null) {
          print(
              'Message also contained a notification: ${message.notification}');
          print('gelen bildirim basligi : ${message.notification?.title}');
          print('message title : ${message.notification?.body}');
          LocalNotificationServices.createNotification(message);
        }
      },
    );

    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      print('app running backgroung');
      if (message.notification != null) {
        print('gelen bildirim basligi : ${message.notification?.title}');
        print('message title : ${message.notification?.body}');
      }
    });

    messaging
        .getToken()
        .then((value) => log('Token : $value', name: 'FCm token'));
  }

  static Future<void> backgroundMessage(RemoteMessage message) async {
    await Firebase.initializeApp();
    print('arka plan mesahlarie ${message.messageId}');
  }
}
