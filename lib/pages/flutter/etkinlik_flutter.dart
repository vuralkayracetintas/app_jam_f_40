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
      title: 'Flutter AppJam Etkinliği',
      description: 'Jam\'e katıldıysan bu etkiliği kaçirma',
      publishedAt: DateTime.parse('2023-04-01 21:00'),
      etkinlikIcerigi:
          'Game & App Jam App Jam açılışı ile başlıyor. Danışmanımız Atıl Samancıoğlu ve Flutter Eğitmenimiz Sercan Yusuf’un katılımıyla gerçekleştireceğimiz etkinlikte App Jam temasını ve App Jam’e dair süreç detaylarını konuşacağız.Katilimlarinizi bekliyoruz.',
    ),
    News(
      title: 'Flutter Soru - Cevap Etkinliği',
      description: 'Jam hakkındak aklına takılanları sorabılırsın',
      publishedAt: DateTime.parse('2023-04-01 21:00'),
      etkinlikIcerigi:
          'Jam App ile ilgili sorularınızı Danışmanımız Atıl Samancıoğlu ve Flutter Eğitmenimiz Sercan Yusuf’un cevaplıyor. Soru tahtasına sorularınızı eklemeyi unutmayınız ',
    ),
  ];

  get news => null;

  // This function is called whenever the text field changes

  List<bool> _isSelectedList = List.generate(3, (index) => false);
  final searchController = TextEditingController();
  @override
  void initState() {
    super.initState();
    searchController.addListener(() {
      setState(() {});
    });
  }

  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        child: TextFormField(
          onChanged: (value) {
            setState(() {
              searchQuery = value;
            });
          },
          decoration: InputDecoration(
            prefixIconColor: const Color(0xff7454e1),
            contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
            suffixIconColor: const Color(0xff7454e1),
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
      searchQuery.isNotEmpty
          ? Expanded(
              child: ListView.builder(
                  itemCount: newsList
                      .where((news) => news.title
                          .toLowerCase()
                          .contains(searchQuery.toLowerCase()))
                      .length,
                  itemBuilder: (
                    BuildContext context,
                    int index,
                  ) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 20.0),
                            padding: const EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              color: control.checkbool.value[index]
                                  ? const Color(0XFFEFB304)
                                  : const Color(0xff7454E1),
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(
                                  color: control.checkbool.value[index]
                                      ? const Color(0xff7454E1)
                                      : const Color(0XFFEFB304),
                                  width: 2),
                            ),
                            child: ListTile(
                              title: Text(
                                newsList[index].title,
                                style: TextStyle(
                                  color: control.checkbool.value[index]
                                      ? Color.fromARGB(255, 0, 0, 0)
                                      : Color.fromARGB(255, 255, 255, 255),
                                ),
                              ),

                              subtitle: Text(
                                newsList[index].description,
                                style: TextStyle(
                                  color: control.checkbool.value[index]
                                      ? Color.fromARGB(255, 0, 0, 0)
                                      : Color.fromARGB(255, 255, 255, 255),
                                ),
                              ),
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
                                    builder: (context) => EtliklikDetailsPage(
                                        news: newsList[index]),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            )
          : const Text('Listede eleman bulunamadi')
    ]));
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

class RatingController extends GetxController {
  double _rating = 0.0;
  double get savedRating => _rating;

  void updateRating(double rating) {
    _rating = rating;
  }
}

class _EtliklikDetailsPageState extends State<EtliklikDetailsPage> {
  double opacityLevel = 0;

  final durumController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        opacityLevel = 1;
      });
      durumController.addListener(() {
        setState(() {});
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*  backgroundColor: Color.fromARGB(255, 255, 245, 153),*/ /*renk denemesi*/
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
                mainAxisAlignment: MainAxisAlignment.start,
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
                  const SizedBox(height: 8.0),
                  Text(
                    widget.news.description,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 8.0),
                  // Text(
                  //   DateFormat.yMd().add_Hms().format(widget.news.publishedAt),
                  //   style: Theme.of(context).textTheme.bodySmall,
                  // ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 10),
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

                  Padding(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.07,
                      bottom: 10,
                    ),
                    child: const Text('Etkinlikten Memnun Kaldiniz Mi ?'),
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
                      Get.put(RatingController());
                      Get.find<RatingController>().updateRating(rating);
                    },
                  ),
                  const SizedBox(height: 16),
                  const SizedBox(height: 30),
                  TextFormField(
                    decoration: InputDecoration(
                      prefixIconColor: Colors.deepPurpleAccent,
                      suffixIconColor: Colors.deepPurpleAccent,
                      prefixIcon: const Icon(Icons.message),
                      border: const OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff7454E1))),
                      labelText: 'Neden Bu Puani verdin ?',
                      hintText: 'Kisa bir cumle ile aciklayiniz',
                      suffixIcon: durumController.text.isEmpty
                          ? Container(width: 0)
                          : IconButton(
                              icon: const Icon(Icons.close),
                              onPressed: () {
                                durumController.clear();
                              },
                            ),
                    ),
                    controller: durumController,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff7454e1),
                        minimumSize:
                            Size(MediaQuery.of(context).size.width * 0.7, 40)),
                    onPressed: () {
                      final rating = Get.find<RatingController>()._rating;
                      final text = durumController.text;
                      customMyDialog(context, rating, text);
                      durumController.clear();
                    },
                    child: const Text(
                      'Gonder',
                    ),
                  ),
                  const SizedBox(
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
}
