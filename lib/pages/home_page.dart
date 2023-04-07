import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jam_app/pages/flutter/flutter_duyuru_page.dart';

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
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    HomeButtonPage(),
    Text(
      'Index 1: Gecmis etkinlikler',
      textAlign: TextAlign.center,
      style: optionStyle,
    ),
    Text(
      'Index 2: Aylik Gorevler',
      style: optionStyle,
    ),
    Text(
      'Index 3: Gelecek etlik',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Color(0xff4285f4),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
            backgroundColor: Color(0xffea4335),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
            backgroundColor: Color(0xfffbbc05),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
            backgroundColor: Color(0xff34a853),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
      body: Center(child: _widgetOptions.elementAt(_selectedIndex)),
    );
  }
}

class HomeButtonPage extends StatelessWidget {
  const HomeButtonPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              minimumSize: Size(MediaQuery.of(context).size.width * 0.6, 35)),
          onPressed: () {
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
          style: ElevatedButton.styleFrom(
              minimumSize: Size(MediaQuery.of(context).size.width * 0.6, 35)),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (BuildContext) => NewsList()));
          },
          child: const Text(
            'Unity Duyuru Sayfasi',
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              minimumSize: Size(MediaQuery.of(context).size.width * 0.6, 35)),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (BuildContext) => NewsList()));
          },
          child: const Text(
            'Akademi Genel Duyuru Sayfasi',
          ),
        )
      ],
    );
  }
}
