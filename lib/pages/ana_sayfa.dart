import 'package:flutter/material.dart';
import 'package:jam_app/pages/package/use_url.dart';
import 'package:jam_app/pages/tabbar/custom_tabbar_flutter.dart';
import 'package:jam_app/pages/tabbar/custom_tabbar_genel.dart';
import 'package:jam_app/pages/tabbar/custom_tabbar_unity.dart';
import 'package:jam_app/pages/widgets/customFAB.dart';

class Ana_sayfa extends StatelessWidget {
  const Ana_sayfa({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: CustomFAB(),
      body: Center(
          child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.2,
            width: MediaQuery.of(context).size.width,
            color: const Color(0xff9A82E9),
            child: Align(
              alignment: Alignment.center,
              child: Row(
                children: [
                  const Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(top: 40.0),
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
                  Image.asset(
                    "assets/images/login.png",
                    fit: BoxFit.cover,
                    height: 200,
                  )
                ],
              ),
            ),
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: () {
              launched = launchInBrowser(akademiLinkedin);
            },
            child: Text(
              'link button',
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomePage()));
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color(0xff7454E1),
              ),
              height: 100,
              width: MediaQuery.of(context).size.width * 0.8,
              child: Row(
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
                  const Spacer(),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(11.0),
                      child: Image.asset(
                        "assets/images/flutter.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          const Spacer(),
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
                  const Spacer(),
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
          const Spacer(),
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
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "GENEL \nDUYURULAR",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 19),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const Spacer(),
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
          Spacer(
            flex: 2,
          )
        ],
      )),
    );
  }
}
