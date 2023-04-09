import 'package:flutter/material.dart';

import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';

class News {
  final String title;
  //final String description;
  //final DateTime publishedAt;

  News({
    required this.title,
    //required this.description,
    //required this.publishedAt
  });
}

class NewsList extends StatefulWidget {
  const NewsList({super.key});

  @override
  _NewsListState createState() => _NewsListState();
}

class CheckGorevContoroller extends GetxController {
  var _checkbool = <bool>[].obs;
  @override
  void onInit() {
    // İlk değerleri false olarak ayarla
    _checkbool.assignAll(List.filled(5, false));
    super.onInit();
  }
}

class _NewsListState extends State<NewsList> {
  final CheckGorevContoroller control = Get.put(CheckGorevContoroller());
  final List<News> newsList = [
    News(
      title:
          'Flutter Eğitimlerinin 12-17 arası modüllerini(%80) tamamla. (ZORUNLU)',
      //description: 'Birinci haber açıklaması',
      //publishedAt: DateTime.parse('2022-04-01 12:34:56'),
    ),
    News(
      title: 'Google Proje Yönetimi Eğitimlerinin 3.kursunu tamamla.(ZORUNLU)',
      //description: 'İkinci haber açıklaması',
      //publishedAt: DateTime.parse('2022-05-03 09:12:34'),
    ),
    News(
      title:
          'Yazılımcılar için İngilizce derslerinin ilk 6 modülünü tamamla.(SEÇENLER İÇİN ZORUNLU)',
      //description: 'Üçüncü haber açıklaması',
      //publishedAt: DateTime.parse('2022-04-02 16:48:23'),
    ),
    News(
      title: 'Game & App Jam’e katıl.(ZORUNLU)',
      //description: 'Üçüncü haber açıklaması',
      //publishedAt: DateTime.parse('2022-04-02 16:48:23'),
    ),
    News(
      title: 'Canlı yayınlara katıl.',
      //description: 'Üçüncü haber açıklaması',
      //publishedAt: DateTime.parse('2022-04-02 16:48:23'),
    ),
  ];
  List<bool> _isSelectedList = List.generate(3, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: newsList.length,
          itemBuilder: (
            BuildContext context,
            int index,
          ) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 20.0),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 20.0),
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: control._checkbool.value[index]
                          ? Color(0xff7454e1)
                          : const Color(0XFFEFB304),
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: ListTile(
                      title: Text(newsList[index].title),

                      // trailing: Text(
                      //   DateFormat.yMd().add_Hms().format(news.publishedAt),
                      // ),
                      leading: Checkbox(
                          onChanged: (bool? value) {
                            setState(() {
                              //
                              control._checkbool[index] = value!;
                              //_isSelectedList[index] = value ?? false;
                            });
                          },
                          value: control._checkbool.value[index]

                          //_isSelectedList[index],
                          ),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
