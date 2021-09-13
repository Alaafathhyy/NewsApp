import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:untitled/model/NewsResponse.dart';
import 'package:untitled/model/Source.dart';
import 'package:untitled/model/SourcesResponse.dart';

const API_KEY = 'f51b72fa36b649499f4a9f7bdba033e8';
const BASE_URL = 'newsapi.org';

Future<SourcesResponse> getNewsTabs(String category) async {
  final uri = Uri.https(BASE_URL, '/v2/top-headlines/sources', {
    'apiKey': API_KEY,
    'category': '$category',
  });
  final response = await http.get(uri);
  if (response.statusCode >= 200 && response.statusCode < 300) {
    return SourcesResponse.fromJson(jsonDecode(response.body));
  } else {
    throw Exception(response.body);
  }
}

Future<NewsResponse> getRequestedNews(Source source) async {
  final uri = Uri.https(BASE_URL, '/v2/everything', {
    'apiKey': API_KEY,
    'sources': source.id,
  });
  final response = await http.get(uri);
  if (response.statusCode >= 200 && response.statusCode < 300) {
    return NewsResponse.fromJson(jsonDecode(response.body));
  } else {
    throw Exception(response.body);
  }
}
