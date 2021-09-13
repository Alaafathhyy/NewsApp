import 'package:untitled/model/Source.dart';

class SourcesResponse {
  String status;
  List<Source> sources;

  SourcesResponse.fromJson(Map<String, dynamic> jsonMap) {
    status = jsonMap["status"];
    sources = List<Source>.from(jsonMap["sources"].map((source) => Source.fromJson(source)));
  }
}
