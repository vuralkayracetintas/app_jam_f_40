import 'package:flutter/material.dart';
import 'package:jam_app/pages/genel/duyuru_genel.dart';
import 'package:jam_app/pages/genel/etkinlik_genel.dart';

class CustomTabbarUnityPage extends StatefulWidget {
  const CustomTabbarUnityPage({super.key});

  @override
  State<CustomTabbarUnityPage> createState() => _CustomTabbarUnityPageState();
}

class _CustomTabbarUnityPageState extends State<CustomTabbarUnityPage>
    with TickerProviderStateMixin {
  late TabController _tabController;
  TabBar get _tabBar => TabBar(
        controller: _tabController,
        indicatorColor: Colors.deepPurpleAccent,
        labelColor: Colors.black,
        tabs: const <Widget>[
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
      length: 2,
      vsync: this,
    );
  }

  /*
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, 
      child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        toolbarHeight: 100,
        title: const Text('Flutter İle Uygulama Geliştirme',
        style: TextStyle(fontWeight: FontWeight.w500),),
        centerTitle: true,
      ),
/*
  indicatorColor: Colors.green, // Seçili olan sekmenin altındaki çizgi rengi
  unselectedLabelColor: Colors.white, // Seçili olmayan sekme etiketlerinin rengi
*/
     
      body: TabBarView(
        controller: _tabController,
        children: const <Widget>[
          Center(
            child: Text("GÖREVLER LİSTESİ"),
          ),
          Center(
            child: Text("DUYURULAR LİSTESİ"),
          ),
          Center(
            child: Text("ETKİNLİKLER LİSTESİ"),
          ),
        ],
      ),
    )
  );
}
} */
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
              backgroundColor: const Color(0xff7454e1),
              elevation: 10,
              toolbarHeight: 100,
              title: const Text(
                'Genel Duyurular',
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
              DuyuruGenel(),
              EtkinlikGenelPage(),
              //DuyuruFlutter(), DuyuruFlutter(), DuyuruFlutter(),

              // Center(
              //   child: Text("GÖREVLER LİSTESİ"),
              // ),
              // Center(
              //   child: Text("DUYURULAR LİSTESİ"),
              // ),
              // Center(
              //   child: Text("ETKİNLİKLER LİSTESİ"),
              // ),
            ],
          ),
        ));
  }
}
