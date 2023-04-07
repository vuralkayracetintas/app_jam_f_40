import 'package:flutter/material.dart';
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

class NewsList extends StatefulWidget {
  @override
  _NewsListState createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  final List<News> newsList = [
    News(
      title: 'Birinci Haber Başlığı',
      description: 'Birinci haber açıklaması',
      publishedAt: DateTime.parse('2022-04-01 12:34:56'),
    ),
    News(
      title: 'İkinci Haber Başlığı',
      description: 'İkinci haber açıklaması',
      publishedAt: DateTime.parse('2022-04-03 09:12:34'),
    ),
    News(
      title: 'Üçüncü Haber Başlığı',
      description: 'Üçüncü haber açıklaması',
      publishedAt: DateTime.parse('2022-04-02 16:48:23'),
    ),
  ];
  final List<bool> _isSelectedList = List.generate(3, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Haberler'),
      ),
      body: ListView(
        children: newsList.asMap().entries.map((entry) {
          int index = entry.key;
          News news = entry.value;
          return Container(
            margin:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: _isSelectedList[index]
                  ? Colors.yellow
                  : Colors.deepPurpleAccent,
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(color: Colors.grey),
            ),
            child: ListTile(
              leading: Checkbox(
                onChanged: (bool? value) {
                  setState(() {
                    _isSelectedList[index] = value ?? false;
                  });
                },
                value: _isSelectedList[index],
              ),
              title: Text(news.title),
              subtitle: Text(news.description),
              trailing: Text(
                DateFormat.yMd().add_Hms().format(news.publishedAt),
              ),
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
