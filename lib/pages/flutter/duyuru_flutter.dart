import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';

class News {
  final String title;
  final String description;
  final DateTime publishedAt;

  News(
      {required this.title,
      required this.description,
      required this.publishedAt});
}

class DuyuruFlutter extends StatefulWidget {
  const DuyuruFlutter({super.key});

  @override
  State<DuyuruFlutter> createState() => _DuyuruFlutterState();
}

class CheckDuyuruContoroller extends GetxController {
  var checkbool = <bool>[].obs;
  @override
  void onInit() {
    // İlk değerleri false olarak ayarla
    checkbool.assignAll(List.filled(5, false));
    super.onInit();
  }
}

class _DuyuruFlutterState extends State<DuyuruFlutter> {
  final CheckDuyuruContoroller control = Get.put(CheckDuyuruContoroller());
  final List<News> newsList = [
    News(
      title: 'Bu aksamki etkinlige herkesi bekliyoruz',
      description: 'Katilim zorunlu degil',
      publishedAt: DateTime.parse('2022-04-01 12:34:56'),
    ),
  ];
  List<bool> _isSelectedList = List.generate(3, (index) => false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: newsList.asMap().entries.map((entry) {
          int index = entry.key;
          News news = entry.value;
          return Container(
            margin:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: control.checkbool.value[index]
                  ? Color(0xff7454e1)
                  : const Color(0XFFEFB304),
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(color: Colors.grey),
            ),
            child: ListTile(
              leading: Checkbox(
                  onChanged: (bool? value) {
                    setState(() {
                      //
                      control.checkbool[index] = value!;
                      //_isSelectedList[index] = value ?? false;
                    });
                  },
                  value: control.checkbool.value[index]

                  //_isSelectedList[index],
                  ),
              title: Text(news.title),
              subtitle: Text(news.description),
              // trailing: Text(
              //   DateFormat.yMd().add_Hms().format(news.publishedAt),
              // ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NewsDetail(news: news),
                  ),
                );
              },
            ),
          );
        }).toList(),
      ),
    );
  }
}

class NewsDetail extends StatefulWidget {
  final News news;

  const NewsDetail({Key? key, required this.news}) : super(key: key);

  @override
  State<NewsDetail> createState() => _NewsDetailState();
}

class _NewsDetailState extends State<NewsDetail> {
  double opacityLevel = 0;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        opacityLevel = 1;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.news.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AnimatedOpacity(
              opacity: opacityLevel,
              duration: const Duration(milliseconds: 1000),
              child: Column(
                children: [
                  Text(
                    widget.news.title,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8.0),
                  // Text(
                  //   widget.news.description,
                  //   style: Theme.of(context).textTheme.bodyMedium,
                  // ),
                  const SizedBox(height: 8.0),
                  // Text(
                  //   DateFormat.yMd().add_Hms().format(widget.news.publishedAt),
                  //   style: Theme.of(context).textTheme.bodySmall,
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}