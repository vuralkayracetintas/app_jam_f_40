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

class DuyuruGenel extends StatefulWidget {
  const DuyuruGenel({super.key});

  @override
  State<DuyuruGenel> createState() => _DuyuruGenelState();
}

class CheckDuyuruGenelContoroller extends GetxController {
  var checkbool = <bool>[].obs;
  @override
  void onInit() {
    // İlk değerleri false olarak ayarla
    checkbool.assignAll(List.filled(5, false));
    super.onInit();
  }
}

class _DuyuruGenelState extends State<DuyuruGenel> {
  final CheckDuyuruGenelContoroller control =
      Get.put(CheckDuyuruGenelContoroller());
  final List<News> newsList = [
    News(
      title: 'Game & App Jam başlıyor',
      description: 'Beklenen Gun Geldi',
      publishedAt: DateTime.parse('2022-04-01 12:34:56'),
      etkinlikIcerigi:
          'Herkese merhaba, Akademi’de ilk ürünlerinizi geliştireceğiniz Game & App Jam başlıyor, 6-10 Nisan tarihleri arasında gerçekleşecek olan bu sürece mezun olabilmeniz için katılım ZORUNLU Önümüzdeki hafta sizinle hem detayları paylaşacağız ve kayıt formu ileteceğiz. Kayıt yapıp sürece katılan arkadaşlarımıza formda ilettikleri adres üzerinden Akademi hediyelerini ileteceğiz.',
      etkinlikUrl: Uri(
        scheme: 'https',
        host: 'www.google.com',
        path: '',
      ),
    ),
    News(
      title: '''Temel Girişimcilik Soru Cevap Etkinliğimiz BAŞLADI!''',
      description: 'Seni bekliyoruz ! ',
      publishedAt: DateTime.parse('2022-04-01 12:34:56'),
      etkinlikIcerigi:
          'Temel Girişimcilik Soru Cevap Etkinliğimiz BAŞLADI! Eğitmenlerimiz Ömer Erken ve Sonat Kaymaz Girişimciliğe dair merak ettiklerinizi cevaplıyor. Bu keyifli ve öğretici etkinliğe müsait olan herkesi bekliyoruz',
      etkinlikUrl: Uri(
        scheme: 'https',
        host: 'www.google.com',
        path: '',
      ),
    ),
    News(
      title: 'IDEATHON BAŞLIYOR!',
      description: 'Fikirler Yarisiyor',
      publishedAt: DateTime.parse('2022-04-01 12:34:56'),
      etkinlikIcerigi:
          '''Ideathon’a dair tüm detayları bu kılavuzda görebilirsiniz, takımlarınızı da bu listeye ekledik. Slack DM grubu veya kapalı kanal aracılığıyla takım arkadaşlarınızı bir araya getirebilirsiniz. Güzel bir ideathon süreci olsun herkese!
Yarın akşam ideathon temalarınıza dair detayları canlı yayında öğreneceksiniz, yayın kaydı alınacak.
''',
      etkinlikUrl: Uri(
        scheme: 'https',
        host: 'www.google.com',
        path: '',
      ),
    ),
    News(
      title: 'Aralık- Ocak görevleri takip',
      description: 'Gorevler Basliyorrr',
      publishedAt: DateTime.parse('2022-04-01 12:34:56'),
      etkinlikIcerigi:
          'Herkese merhaba, umarız iyisinizdir. Sizlere Aralık- Ocak görevlerinizin takiplerini göndermeye başladık. Durum güncellemelerini almayan arkadaşlarımıza da en kısa süre içerisinde iletmeye devam edeceğiz. Unutmayın görevleri tamamlamanız için son tarih 31 Ocak! Not: Gönderilen mesajda yer alan tamamlanmayan görevlerini 31 Ocak’a kadar tamamla ibaresini Görevler Tamamlandı durumunda iseniz dikkate almayınız.',
      etkinlikUrl: Uri(
        scheme: 'https',
        host: 'www.google.com',
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
                  ? const Color(0xff7454e1)
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
                      padding: const EdgeInsets.only(bottom: 50),
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
                        backgroundColor: const Color(0xff7454E1),
                      ),
                      onPressed: () {
                        launchInBrowser(widget.news.etkinlikUrl);
                      },
                      child: const Text(
                        'Etkinlige Gitmek Icin Tiklayini',
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
