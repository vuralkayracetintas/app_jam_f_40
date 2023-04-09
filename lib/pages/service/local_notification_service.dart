//"@drawable/ic_stat_a"

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationServices {
  static final FlutterLocalNotificationsPlugin notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static void initialize() {
    InitializationSettings initializationSettingsAndroid =
        InitializationSettings(
            android:
                const AndroidInitializationSettings("@mipmap/launcher_icon"),
            iOS: DarwinInitializationSettings(
              requestAlertPermission: true,
              requestBadgePermission: true,
              requestSoundPermission: true,
              onDidReceiveLocalNotification: (id, title, body, payload) {},
            ));
    notificationsPlugin.initialize(initializationSettingsAndroid);
  }

  static void createNotification(RemoteMessage message) async {
    print('local notification calisti');
    try {
      final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;
      const NotificationDetails notificationDetails = NotificationDetails(
          android: AndroidNotificationDetails(
              "pushnotification", "pushnotificationchannel",
              importance: Importance.high,
              priority: Priority.high,
              playSound: true),
          iOS: DarwinNotificationDetails(
            presentAlert: true,
            presentBadge: true,
            presentSound: true,
          ));
      await notificationsPlugin.show(
        0,
        message.notification!.title,
        message.notification!.body,
        notificationDetails,
      );
    } on Exception catch (e) {
      print(e);
    }
  }
}
