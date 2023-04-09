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

class EtkinlikFlutterPage extends StatefulWidget {
  const EtkinlikFlutterPage({super.key});

  @override
  State<EtkinlikFlutterPage> createState() => _EtkinlikFlutterPageState();
}

class CheckEtklikContoroller extends GetxController {
  var checkbool = <bool>[].obs;
  @override
  void onInit() {
    // İlk değerleri false olarak ayarla
    checkbool.assignAll(List.filled(5, false));
    super.onInit();
  }
}

class _EtkinlikFlutterPageState extends State<EtkinlikFlutterPage> {
  final CheckEtklikContoroller control = Get.put(CheckEtklikContoroller());
  final List<News> newsList = [
    News(
      title: 'Flutter AppJam Eklinligi',
      description: 'Jam\'e katildiysan buraya gelmelisin',
      publishedAt: DateTime.parse('2023-04-01 12:34:56'),
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
                      margin: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: control.checkbool.value[index]
                            ? Color(0xff7454e1)
                            : const Color(0XFFEFB304),
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: ListTile(
                        title: Text(newsList[index].title),
                        subtitle: Text(newsList[index].description),
                        // trailing: Text(
                        //   DateFormat.yMd().add_Hms().format(news.publishedAt),
                        // ),
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
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  EtliklikDetailsPage(news: newsList[index]),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            }));
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
        backgroundColor: Color(0xff7454e1),
        title: Text('Oyun ve Uygulama Akademisi'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
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
                      DateFormat.yMd()
                          .add_Hms()
                          .format(widget.news.publishedAt),
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff7454e1),
                      ),
                      onPressed: () {},
                      child: Text(
                        'etkinlige gitmek icin tiklayiniz',
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
