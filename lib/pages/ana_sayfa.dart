import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Ana_sayfa extends StatelessWidget {
  const Ana_sayfa({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          Container(
            child: Align(
              alignment: Alignment.center,
              child: Row(
                children: [
                  Text(
                    "OYUN VE UYGULAMA \n AKADEMİSİ'NE HOŞ GELDİN!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 19),
                  ),
                  Image.asset(
                    "assets/images/genel.png",
                    fit: BoxFit.cover,
                  )
                ],
              ),
            ),
            height: 150,
            width: MediaQuery.of(context).size.width,
            color: Color(0xff9A82E9),
          ),
          Spacer(),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color(0xff7454E1),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "FLUTTER",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                ),
                Spacer(),
                Image.asset(
                  "assets/images/flutter.png",
                  fit: BoxFit.cover,
                )
              ],
            ),
            height: 100,
            width: MediaQuery.of(context).size.width * 0.8,
          ),
          Spacer(),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color(0xff7454E1),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "UNITY",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                ),
                Spacer(),
                Image.asset(
                  "assets/images/unity.jpg",
                  fit: BoxFit.cover,
                )
              ],
            ),
            height: 100,
            width: MediaQuery.of(context).size.width * 0.8,
          ),
          Spacer(),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color(0xff7454E1),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "GENEL DUYURULAR",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 22),
                  ),
                ),
                Spacer(),
                Image.asset(
                  "assets/images/genel.png",
                  fit: BoxFit.cover,
                )
              ],
            ),
            height: 100,
            width: MediaQuery.of(context).size.width * 0.8,
          ),
          Spacer(),
        ],
      )),
    );
  }
}
