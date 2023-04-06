import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jam_app/pages/flutter_duyuru_page.dart';

class News {
  final String title;
  final String description;
  final DateTime publishedAt;

  News(
      {required this.title,
      required this.description,
      required this.publishedAt});
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
double opacityLevel = 1.0;
 void _changeOpacity() {
    setState(() => opacityLevel = opacityLevel == 0 ? 1.0 : 0.0);
  }

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedOpacity(
          opacity: opacityLevel,
          duration: const Duration(seconds: 3),
          child: const FlutterLogo(),
        ),
            ElevatedButton(
              onPressed: () {
                _changeOpacity;
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext) =>
                            NewsList())); //todo new list change file name
              },
              child: const Text(
                'Flutter Duyuru Sayfasi',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext) => NewsList()));
              },
              child: const Text(
                'Unity Duyuru Sayfasi',
              ),
            )
          ],
        ),
      ),
    );
  }
}
