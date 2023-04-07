import 'dart:async';

import 'package:flutter/material.dart';
import 'package:jam_app/pages/home_page.dart';
import 'package:lottie/lottie.dart';

class SplachScreen extends StatefulWidget {
  const SplachScreen({super.key});

  @override
  State<SplachScreen> createState() => _SplachScreenState();
}

class _SplachScreenState extends State<SplachScreen> {
  double opacityLevel = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 5), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => HomePage()));
    });

    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        opacityLevel = 1;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff7454E1),
      body: Center(
        child: AnimatedOpacity(
          opacity: opacityLevel,
          duration: const Duration(milliseconds: 1000),
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              // Image(
              //     height: MediaQuery.of(context).size.height * 0.3,
              //     image: AssetImage('assets/images/akademilogo.png')),
              const Image(image: AssetImage('assets/images/oua.png')),
              //akademilogo
              const SizedBox(height: 60),
              Text(
                'OYUN VE UYGULAMA AKADEMİSİNE HOŞ \nGELDİN 🚀🚀',
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                  width: MediaQuery.of(context).size.width,
                  child:
                      Lottie.asset('assets/animations/21458-google-logo.zip')),
              const SizedBox(height: 60),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    double height = size.height;
    double width = size.width;
    path.lineTo(0, height);
    path.quadraticBezierTo(width / 2, height, width, height - 200);
    path.lineTo(width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}




/*

 SizedBox(
            height: 200,
            child: Stack(children: [
              ClipPath(
                  clipper: CustomShape(),
                  child: Container(
                    height: 300,
                    color: Colors.amber,
                  )),
              Padding(
                padding: const EdgeInsets.only(top: 195.0),
                child: Column(
                  children: [
                    CircularProgressIndicator(
                      valueColor:
                          AlwaysStoppedAnimation<Color>(Colors.deepPurple),
                    ),
                    Text('OYUN VE UYGULAMA AKADEMISINE HOSGELDIN',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headlineLarge)
                  ],
                ),
              ),
            ])));
*/
