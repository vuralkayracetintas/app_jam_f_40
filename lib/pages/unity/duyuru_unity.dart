import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';
import 'package:jam_app/pages/package/use_url.dart';

class News {
  final String title;
  final String description;
  final DateTime publishedAt;
  final String etkinlikIcerigi;
  final Uri etkinlikUrl;

  News({
    required this.title,
    required this.description,
    required this.publishedAt,
    required this.etkinlikIcerigi,
    required this.etkinlikUrl,
  });
}

class DuyuruUnity extends StatefulWidget {
  const DuyuruUnity({super.key});

  @override
  State<DuyuruUnity> createState() => _DuyuruUnityState();
}

class CheckDuyuruUnityContoroller extends GetxController {
  var checkbool = <bool>[].obs;
  @override
  void onInit() {
    // İlk değerleri false olarak ayarla
    checkbool.assignAll(List.filled(5, false));
    super.onInit();
  }
}

class _DuyuruUnityState extends State<DuyuruUnity> {
  final CheckDuyuruUnityContoroller control =
      Get.put(CheckDuyuruUnityContoroller());
  final List<News> newsList = [
    News(
        title: 'Game Jam Soru Cevap Etkinligi',
        description: 'Icinde kalmasin sor gitsin',
        publishedAt: DateTime.parse('2023-04-01 12:34:56'),
        etkinlikIcerigi:
            'Merhabalar Unity Eğitmenimiz Tolgay Hıçkıran Game Jam’e dair sorularınızı yanıtlamak için sizleri bekliyo',
        etkinlikUrl: Uri(
          scheme: 'https',
          host: 'www.youtube.com',
          path: '/watch?v=ZdA2JYh2Pws',
          //https://www.youtube.com/watch?v=ZdA2JYh2Pws
        )),
    // News(
    //     title: 'Game Jam Basladiiiiii ',
    //     description: 'Yoksa sen hala kod yazmiyor musun ? ',
    //     publishedAt: DateTime.parse('2022-04-01 12:34:56'),
    //     etkinlikIcerigi:
    //         'İyi akşamlar Game Jam Açılışımızı tamamladık. Game Jam konseptimiz “Akademi Maceraları” Eğer izlemediyseniz etkinlik kaydına buradan ulaşabilirsiniz.',
    //     etkinlikUrl: Uri(
    //         scheme: 'https',
    //         host: 'www.linkedin.com',
    //         path: '/company/oyun-ve-uygulama-akademisi/')),
    News(
        title: 'Game Jam Acilisi Basladi',
        description: 'Game Jam Temasi belirleniyor kacirma',
        publishedAt: DateTime.parse('2022-04-01 12:34:56'),
        etkinlikIcerigi:
            'Merhabalar Game Jam açılışı BAŞLADI! Danışmanımız Atıl Samancıoğlu ve Unity Eğitmenimiz Tolgay Hıçkıran’ın katılımıyla gerçekleştireceğimiz etkinlikte Game Jam temasını ve Game Jam’e dair süreç detaylarını konuşacağız',
        etkinlikUrl: Uri(
            scheme: 'https',
            host: 'www.youtube.com',
            path: '/live/BXom3U92yqk?feature=share')),
    //https://www.youtube.com/live/BXom3U92yqk?feature=share
    News(
        title: 'Unity Soru Cevap Etklinligi - 3 ',
        description: 'Soru Tahtasina Sorulari Eklemeyi Unutmayin',
        etkinlikIcerigi:
            'Merhabalar, BUGÜN 20.00 da Unity Soru - Cevap Etkinliğimiz var. Eğitmenimiz Tolgay Hıçkıran Unity eğitimine dair merak ettiklerinizi cevaplıyor olacak. Sorularınızı şimdiden Soru Tahtası’na yazabilirsiniz.',
        publishedAt: DateTime.parse('2022-04-01 12:34:56'),
        etkinlikUrl: Uri(
            scheme: 'https',
            host: 'www.youtube.com',
            path: '/live/utQbSM5GYpw?feature=share')),
    //https://www.youtube.com/live/utQbSM5GYpw?feature=share
    News(
        title: 'Unity Soru Cevap Etklinligi - 2 ',
        description: 'Soru Tahtasina Sorulari Eklemeyi Unutmayin',
        etkinlikIcerigi:
            'Merhabalar, BUGÜN 20.00 da Unity Soru - Cevap Etkinliğimiz var. Eğitmenimiz Tolgay Hıçkıran Unity eğitimine dair merak ettiklerinizi cevaplıyor olacak. Sorularınızı şimdiden Soru Tahtası’na yazabilirsiniz.',
        publishedAt: DateTime.parse('2022-04-01 12:34:56'),
        etkinlikUrl: Uri(
            scheme: 'https',
            host: 'www.youtube.com',
            path: '/live/vh3Yc2csn7g?feature=share')),
    //https://www.youtube.com/live/vh3Yc2csn7g?feature=share
    News(
        title: 'Unity Soru Cevap Etklinligi - 1 ',
        description: 'Soru Tahtasina Sorulari Eklemeyi Unutmayin',
        etkinlikIcerigi:
            'Merhabalar, BUGÜN 20.00 da Unity Soru - Cevap Etkinliğimiz var. Eğitmenimiz Tolgay Hıçkıran Unity eğitimine dair merak ettiklerinizi cevaplıyor olacak. Sorularınızı şimdiden Soru Tahtası’na yazabilirsiniz.',
        publishedAt: DateTime.parse('2022-04-01 12:34:56'),
        etkinlikUrl: Uri(
            scheme: 'https',
            host: 'www.youtube.com',
            path: '/live/pTU4Ei-JdeU?feature=share')),
    //https://www.youtube.com/watch?v=pTU4Ei-JdeU
    //https://m.youtube.com/watch?v=pTU4Ei-JdeU
    //https://www.youtube.com/live/pTU4Ei-JdeU?feature=share
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
                child: Container(
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
                    title: Text(newsList[index].title),
                    subtitle: Text(newsList[index].description),
                    // trailing: Text(
                    //   DateFormat.yMd().add_Hms().format(news.publishedAt),
                    // ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              NewsDetail(news: newsList[index]),
                        ),
                      );
                    },
                  ),
                ),
              );
            }));
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
        backgroundColor: Color(0xff7454e1),
        title: Text('Oyun ve Uygulama Akademisi'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedOpacity(
                opacity: opacityLevel,
                duration: const Duration(milliseconds: 1000),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 50),
                      child: Text(
                        widget.news.title,
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                        textAlign: TextAlign.center,
                      ),
                    ),

                    Text(
                      widget.news.etkinlikIcerigi,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 8.0),
                    // Text(
                    //   DateFormat.yMd().add_Hms().format(widget.news.publishedAt),
                    //   style: Theme.of(context).textTheme.bodySmall,
                    // ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff7454E1),
                      ),
                      onPressed: () {
                        launchInBrowser(widget.news.etkinlikUrl);
                      },
                      child: Text(
                        'Gitmek icin tıklayınız',
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
