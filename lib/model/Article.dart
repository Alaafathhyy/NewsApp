import 'Source.dart';

class Article {
  Source source;
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String publishedAt;
  String content;

  Article.fromJson(Map<String, dynamic> jsonMap) {
    source = jsonMap['source'] != null ? new Source.fromJson(jsonMap['source']) : null;
    author = jsonMap['author'];
    title = jsonMap['title'];
    description = jsonMap['description'];
    url = jsonMap['url'];
    urlToImage = jsonMap['urlToImage'];
    publishedAt = jsonMap['publishedAt'];
    content = jsonMap['content'];
  }
}
