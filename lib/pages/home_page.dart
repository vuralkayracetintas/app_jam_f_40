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

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext) => NewsList()));
              },
              child: const Text(
                'Flutter Duyuru Sayfasi',
              ),
            )
          ],
        ),
      ),
    );
  }
}
