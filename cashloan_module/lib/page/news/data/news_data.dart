class NewsData {
  final String title;
  final String descrption;
  final String urlToImage;

  NewsData({this.title, this.descrption, this.urlToImage});

  factory NewsData.fromJson(Map<String, dynamic> json) {
    return NewsData(
        title: json['title'],
        descrption: json['description'],
        urlToImage: json['urlToImage']);
  }
}

List<NewsData> listNews(Map<String, dynamic> response) {
  Iterable list = response['articles'];

  return List<NewsData>.from(list.map((x) => NewsData.fromJson(x)));
}
