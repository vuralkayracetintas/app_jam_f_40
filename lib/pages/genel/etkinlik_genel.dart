// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class News {
  final String title;
  final String description;
  final DateTime publishedAt;

  News(
      {required this.title,
      required this.description,
      required this.publishedAt});
}

class EtkinlikGenelPage extends StatefulWidget {
  const EtkinlikGenelPage({super.key});

  @override
  State<EtkinlikGenelPage> createState() => _EtkinlikGenelPageState();
}

class CheckEtklikGenelContoroller extends GetxController {
  var checkbool = <bool>[].obs;
  @override
  void onInit() {
    // İlk değerleri false olarak ayarla
    checkbool.assignAll(List.filled(5, false));
    super.onInit();
  }
}

class _EtkinlikGenelPageState extends State<EtkinlikGenelPage> {
  final CheckEtklikGenelContoroller control =
      Get.put(CheckEtklikGenelContoroller());
  final List<News> newsList = [
    News(
      title:
          'Merhabalar, YARIN 21.00\'da Girişimciler için Finans Soru Cevap Buluşmamız var Eğitmenimiz Serhat Yanık Girişimcilikte Finans\’a dair merak ettiklerinizi cevaplıyor olacak.',
      description: 'Katılım zorunlu değil.',
      publishedAt: DateTime.parse('2022-04-01 12:34:56'),
    ),
  ];
  List<bool> _isSelectedList = List.generate(3, (index) => false);
     final searchController = TextEditingController();
  @override
  void initState() {
    super.initState();
    searchController.addListener(() {
      setState(() {});
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: newsList.asMap().entries.map((entry) {
          int index = entry.key;
          News news = entry.value;
          return Column(
            children: [Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 20.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    prefixIconColor: Color(0xff7454e1),
                    contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                    suffixIconColor: Color(0xff7454e1),
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    labelText: 'Etkinlik Ara',
                    suffixIcon: searchController.text.isEmpty
                        ? Container(width: 0)
                        : IconButton(
                            icon: const Icon(Icons.close),
                            onPressed: () {
                              searchController.clear();
                            },
                          ),
                  ),
                  controller: searchController,
                ),
              ),
              Container(
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
                  // title: Text(news.title),
                  // subtitle: Text(news.description),
                  // trailing: Text(
                  //   DateFormat.yMd().add_Hms().format(news.publishedAt),
                  // ),
                  title: Text(news.title),
                  subtitle: Text(
                    DateFormat.yMd().add_Hms().format(news.publishedAt),
                  ),

                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EtliklikDetailsPage(news: news),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}

class EtliklikDetailsPage extends StatefulWidget {
  final News news;
  const EtliklikDetailsPage({
    Key? key,
    required this.news,
  }) : super(key: key);

  @override
  State<EtliklikDetailsPage> createState() => _EtliklikDetailsPageState();
}

class _EtliklikDetailsPageState extends State<EtliklikDetailsPage> {
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
                  Text(
                    widget.news.description,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    DateFormat.yMd().add_Hms().format(widget.news.publishedAt),
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
