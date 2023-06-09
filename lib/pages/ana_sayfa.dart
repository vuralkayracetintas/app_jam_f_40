import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jam_app/pages/package/use_url.dart';
import 'package:jam_app/pages/service/firebase_notification_service.dart';
import 'package:jam_app/pages/tabbar/custom_tabbar_flutter.dart';
import 'package:jam_app/pages/tabbar/custom_tabbar_genel.dart';
import 'package:jam_app/pages/tabbar/custom_tabbar_unity.dart';
import 'package:jam_app/pages/widgets/customFAB.dart';

class Ana_sayfa extends StatefulWidget {
  const Ana_sayfa({super.key});

  @override
  State<Ana_sayfa> createState() => _Ana_sayfaState();
}

class _Ana_sayfaState extends State<Ana_sayfa> {
  bool isDarkModeEnabled = false;

  void _toggleTheme() {
    setState(() {
      isDarkModeEnabled = !isDarkModeEnabled;
    });
  }

  final service = FirebaseNotificationService();
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    super.initState();

    service.connectionNotification();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff9A82E9),
      floatingActionButton: CustomFAB(),
      body: Stack(children: [
        Column(
          children: [
            SvgPicture.asset(
              'assets/images/background_2.svg',
              height: MediaQuery.of(context).size.height,
              semanticsLabel: 'My SVG Image',
            ),
          ],
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.width,
                color: const Color(0xff9A82E9),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: 10, top: 40.0),
                        child: Text(
                          "OYUN VE UYGULAMA \n AKADEMİSİ'NE \nHOŞ GELDİN!",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Image.asset(
                        "assets/images/login.png",
                        fit: BoxFit.cover,
                        height: 200,
                      ),
                    )
                  ],
                ),
              ),
              Spacer(),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomePage()));
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xff7454E1),
                  ),
                  height: 100,
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "FLUTTER",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 25),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(11.0),
                        child: Image.asset(
                          "assets/images/flutter.png",
                          fit: BoxFit.cover,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Spacer(),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CustomTabBarUnity()));
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xff7454E1),
                  ),
                  height: 100,
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "UNITY",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 25),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          "assets/images/unity.png",
                          fit: BoxFit.cover,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Spacer(),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CustomTabbarUnityPage()));
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xff7454E1),
                  ),
                  height: 100,
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "GENEL \nDUYURULAR",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 25),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          "assets/images/genel.png",
                          fit: BoxFit.cover,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Spacer(),
              SizedBox(
                height: 50,
              )
            ],
          ),
        ),
      ]),
    );
  }
}
