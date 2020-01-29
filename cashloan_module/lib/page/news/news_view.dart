import 'package:cashloan_module/page/news/data/news_data.dart';
import 'package:flutter/material.dart';

class NewsView extends StatelessWidget {
  final List<NewsData> listNews;

  NewsView({this.listNews});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listNews.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Image.network(listNews[index].urlToImage),
          subtitle: Text(listNews[index].title),
        );
      },
    );
  }
}
