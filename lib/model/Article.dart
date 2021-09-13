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

  Article.fromJson(Map<String, dynamic> jsonMap)
      : source = Source.fromJson(jsonMap["source"]),
        author = jsonMap["author"] != null ? jsonMap["author"] : '',
        title = jsonMap["title"] != null ? jsonMap["title"] : '',
        description = jsonMap["description"] != null ? jsonMap["description"] : '',
        url = jsonMap["url"] != null ? jsonMap["url"] : '',
        urlToImage = jsonMap["urlToImage"] != null ? jsonMap["urlToImage"] : '',
        publishedAt = jsonMap["publishedAt"] != null ? jsonMap["publishedAt"] : '',
        content = jsonMap["content"] != null ? jsonMap["content"] : '';
}
