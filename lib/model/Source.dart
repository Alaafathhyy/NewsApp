class Source {
  String id;
  String name;
  String description;
  String url;
  String category;
  String language;
  String country;

  Source.fromJson(Map<String, dynamic> jsonMap) {
    id = jsonMap['id'];
    name = jsonMap['name'];
    description = jsonMap['description'];
    url = jsonMap['url'];
    category = jsonMap['category'];
    language = jsonMap['language'];
    country = jsonMap['country'];
  }
}
