// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class News {
  final String title;
  final String description;
  final DateTime publishedAt;
  final String etkinlikIcerigi;

  News({
    required this.title,
    required this.description,
    required this.publishedAt,
    required this.etkinlikIcerigi,
  });
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
      title: 'Girişimciler için Finans Soru Cevap Buluşması',
      description: 'Katılım zorunlu değil.',
      etkinlikIcerigi:
          'Merhabalar, YARIN 21.00\'da Girişimciler için Finans Soru Cevap Buluşmamız var Eğitmenimiz Serhat Yanık Girişimcilikte Finans\’a dair merak ettiklerinizi cevaplıyor olacak.',
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
      body: ListView(
        children: newsList.asMap().entries.map((entry) {
          int index = entry.key;
          News news = entry.value;
          return Column(
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
                      ? Color(0XFFEFB304)
                      : const Color(0xff7454e1),
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                      color: control.checkbool.value[index]
                          ? const Color(0xff7454E1)
                          : const Color(0XFFEFB304),
                      width: 2),
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
                  title: Text(
                    news.title,
                    style: TextStyle(
                      color: control.checkbool.value[index]
                          ? Color.fromARGB(255, 0, 0, 0)
                          : Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                  subtitle: Text(
                    DateFormat.yMd().add_Hms().format(news.publishedAt),
                    style: TextStyle(
                      color: control.checkbool.value[index]
                          ? Color.fromARGB(255, 0, 0, 0)
                          : Color.fromARGB(255, 255, 255, 255),
                    ),
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

class RatingGenelController extends GetxController {
  double _rating = 0.0;
  double get savedRating => _rating;

  void updateRating(double rating) {
    _rating = rating;
  }
}

class _EtliklikDetailsPageState extends State<EtliklikDetailsPage> {
  double opacityLevel = 0;
  final durumGenelController = TextEditingController();
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
        backgroundColor: const Color(0xff7454e1),
        title: const Text('Oyun ve Uygulama Akademisi'),
      ),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height,
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: AnimatedOpacity(
              opacity: opacityLevel,
              duration: const Duration(milliseconds: 1000),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          alignment: Alignment.center,
                          height: 50,
                          child: Text(
                            widget.news.title,
                            style: Theme.of(context).textTheme.titleLarge,
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            DateFormat.yMd()
                                .add_Hm()
                                .format(widget.news.publishedAt),
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(color: Colors.black),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  Text(
                    widget.news.description,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0, bottom: 10),
                    child: Text(
                      widget.news.etkinlikIcerigi,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff7454e1),
                        minimumSize:
                            Size(MediaQuery.of(context).size.width * 0.7, 40)),
                    onPressed: () {},
                    child: const Text(
                      'Etkinlige Katil',
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  const Padding(
                    padding: EdgeInsets.only(
                      top: 50.0,
                      bottom: 10,
                    ),
                    child: Text('Etkinlikten Memnun Kaldiniz Mi ?'),
                  ),
                  RatingBar.builder(
                    initialRating: 0,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      Get.put(RatingGenelController());
                      Get.find<RatingGenelController>().updateRating(rating);
                    },
                  ),
                  const SizedBox(height: 16),
                  const SizedBox(height: 30),
                  TextFormField(
                    decoration: InputDecoration(
                      prefixIconColor: Colors.deepPurpleAccent,
                      suffixIconColor: Colors.deepPurpleAccent,
                      prefixIcon: const Icon(Icons.mail_outline),
                      border: const OutlineInputBorder(),
                      labelText: 'Neden Bu Puani verdin ?',
                      hintText: 'Kisa bir cumle ile aciklayiniz',
                      suffixIcon: durumGenelController.text.isEmpty
                          ? Container(width: 0)
                          : IconButton(
                              icon: const Icon(Icons.close),
                              onPressed: () {
                                durumGenelController.clear();
                              },
                            ),
                    ),
                    controller: durumGenelController,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff7454e1),
                        minimumSize:
                            Size(MediaQuery.of(context).size.width * 0.7, 40)),
                    onPressed: () {
                      final rating = Get.find<RatingGenelController>()._rating;
                      final text = durumGenelController.text;
                      customMyDialog(context, rating, text);
                      durumGenelController.clear();
                    },
                    child: const Text(
                      'Gonder',
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Future<dynamic> customMyDialog(
    BuildContext context, double rating, String text) {
  return showDialog(
    context: context,
    builder: (BuildContext context) => CupertinoAlertDialog(
      title: const Text('Tesekkurler'),
      content: Column(
        children: [
          Text('Puanin : $rating'),
          Text('Yorumun : $text'),
          const Text(
              'Puanin ve yorumun kaydedildi.Gelecek etkinliklerde gorusmek uzere')
        ],
      ),
      actions: <CupertinoDialogAction>[
        CupertinoDialogAction(
          isDestructiveAction: true,
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            'Tamam',
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: Colors.red),
          ),
        ),
      ],
    ),
  );
}
