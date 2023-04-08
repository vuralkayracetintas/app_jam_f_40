import 'package:flutter/material.dart';
import 'package:jam_app/pages/unity/duyuru_unity.dart';
import 'package:jam_app/pages/unity/etkinlik_unity.dart';
import 'package:jam_app/pages/unity/gorevler_unity.dart';

class CustomTabBarUnity extends StatefulWidget {
  const CustomTabBarUnity({super.key});

  @override
  State<CustomTabBarUnity> createState() => _CustomTabBarUnityState();
}

class _CustomTabBarUnityState extends State<CustomTabBarUnity>
    with TickerProviderStateMixin {
  late TabController _tabController;
  TabBar get _tabBar => TabBar(
        controller: _tabController,
        indicatorColor: Colors.deepPurpleAccent,
        labelColor: Colors.black,
        tabs: const <Widget>[
          Tab(
            icon: Icon(
              Icons.done_outline_sharp,
              color: Colors.white,
            ),
            text: 'GÖREVLER',
          ),
          Tab(
            icon: Icon(
              Icons.notifications_active_sharp,
              color: Colors.white,
            ),
            text: 'DUYURULAR',
          ),
          Tab(
            icon: Icon(
              Icons.emoji_events_sharp,
              color: Colors.white,
            ),
            text: 'ETKİNLİKLER',
          ),
        ],
      );
  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 3,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
              backgroundColor: Colors.deepPurple,
              elevation: 10,
              toolbarHeight: 100,
              title: const Text(
                'Unity İle Uygulama Geliştirme',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              centerTitle: true,
              bottom: PreferredSize(
                preferredSize: _tabBar.preferredSize,
                child: Material(
                  color: const Color(0XFFEFB304),
                  child: _tabBar,
                ),
              )),
          body: TabBarView(
            controller: _tabController,
            children: const <Widget>[
              NewsList(),
              DuyuruUnity(),
              EtkinlikUnityPage(),
            ],
          ),
        ));
  }
}
