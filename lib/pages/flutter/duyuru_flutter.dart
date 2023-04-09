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
      title: 'Flutter Soru – Cevap 1',
      description: 'Sercan Yusuf Flutter eğitimi',
      publishedAt: DateTime.parse('2023-04-03 12:34:56'),
      etkinlikIcerigi:
          'Merhabalar, Flutter Soru – Cevap etinliğimiz başladı. Eğitmenimiz Sercan Yusuf Flutter eğitimi’ne dair merak ettiklerinizi cevaplıyor olacak. Müsait olan herkesi bekleriz.',
      etkinlikUrl: Uri(
        scheme: 'https',
        host: 'www.google.com',
        path: '',
      ),
    ),
    News(
      title: 'Flutter App Jam Soru – Cevap',
      description: 'Eğitmenimiz Sercan Yusuf ile Flutter Soru Cevap',
      publishedAt: DateTime.parse('2023-04-01 12:34:56'),
      etkinlikIcerigi:
          'Merhabalar, Flutter Eğitmenimiz Sercan Yusuf App Jam’e dair sorularınızı yanıtlamak için sizleri bekliyor.',
      etkinlikUrl: Uri(
        scheme: 'https',
        host: 'www.google.com',
        path: '',
      ),
    ),
    News(
      title: 'App Jam Materyal',
      description: 'App Jam’de kullanılabilecek uygulamalar!',
      publishedAt: DateTime.parse('2023-03-27 12:34:56'),
      etkinlikIcerigi:
          'Merhabalar, APP JAM başladı! Konseptimiz Akademi içinde kullanılabilecek uygulamalar! Ek materyallere buradan erişebilir, yayın kaydına ve detaylarına bu bağlantıdan ulaşabilirsiniz. Herkese başarılar diliyoruz!',
      etkinlikUrl: Uri(
        scheme: 'https',
        host: 'www.google.com',
        path: '',
      ),
    ),
    News(
      title: 'App Jam Başladı',
      description: 'Eğitmenlerimizle App Jam hakkında bilgilendirme',
      publishedAt: DateTime.parse('2023-03-23 12:34:56'),
      etkinlikIcerigi:
          'Merhabalar App Jam Açılışı BAŞLADI. Danışmanımız Atıl Samancıoğlu ve Flutter Eğitmenimiz Sercan Yusuf’un katılımıyla gerçekleştireceğimiz etkinlikte App Jam temasını ve App Jam’e dair süreç detaylarını konuşuyoruz. *Etkinliğe katılım zorunlu değil fakat takımınızdan en az bir kişinin katılmasını sürece hâkim olmanız için tavsiye ederiz',
      etkinlikUrl: Uri(
        scheme: 'https',
        host: 'www.youtube.com',
        path: '',
      ),
    ),
    News(
      title: 'Ideathon',
      description: 'Ideathon’da Önceliklendirilen Takımlar',
      publishedAt: DateTime.parse('2023-03-11 12:34:56'),
      etkinlikIcerigi:
          'Merhabalar Ideathon’da Önceliklendirilen Takımları BU AKŞAM 20.00’da Partnerlerimizin de katılımıyla YouTube Canlı Yayın’ında açıklıyoruz.Süreç boyunca gösterdiğimiz ilgi ve emek için hepinize tekrar teşekkür ederizIdeathon Sertifikası alabilmek için Ideathon sonrası değerlendirme formumuzu doldurmanız gerekiyor. Değerlendirme Formumuzu bu akşam paylaşacağız.',
      etkinlikUrl: Uri(
        scheme: 'https',
        host: 'www.youtube.com',
        path: '',
      ),
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
              // leading: Checkbox(
              //     onChanged: (bool? value) {
              //       setState(() {
              //         //
              //         control.checkbool[index] = value!;
              //         //_isSelectedList[index] = value ?? false;
              //       });
              //     },
              //     value: control.checkbool.value[index]

              //     //_isSelectedList[index],
              //     ),
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
        backgroundColor: Color(0xff7454E1),
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
                        'Gitmek için tıklayınız',
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
