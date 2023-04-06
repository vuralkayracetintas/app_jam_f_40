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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Haberler'),
      ),
      body: ListView.builder(
        itemCount: newsList.length,
        itemBuilder: (context, index) {
          final news = newsList[index];
          return ListTile(
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
          );
        },
      ),
    );
  }
}

class NewsDetail extends StatelessWidget {
  final News news;

  const NewsDetail({Key? key, required this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(news.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              news.title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(height: 8.0),
            Text(
              news.description,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            SizedBox(height: 8.0),
            Text(
              DateFormat.yMd().add_Hms().format(news.publishedAt),
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
