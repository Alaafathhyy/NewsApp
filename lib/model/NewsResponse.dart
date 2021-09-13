import 'Article.dart';

class NewsResponse {
  String status;
  int totalResults;
  List<Article> articles;

  NewsResponse({this.status, this.totalResults, this.articles});

  NewsResponse.fromJson(Map<String, dynamic> jsonMap) {
    status = jsonMap['status'];
    totalResults = jsonMap['totalResults'];
    articles = List<Article>.from(jsonMap["articles"].map((it) => Article.fromJson(it)));
  }
}
