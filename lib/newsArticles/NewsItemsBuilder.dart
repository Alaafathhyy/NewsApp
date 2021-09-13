import 'package:flutter/material.dart';
import 'package:untitled/api/ApiServices.dart';
import 'package:untitled/newsArticles/NewsItemWidget.dart';
import '../model/NewsResponse.dart';
import '../model/Source.dart';

class NewsItemsBuilder extends StatefulWidget {
  final Source source;
  NewsItemsBuilder({@required this.source});

  @override
  _NewsItemsBuilderState createState() => _NewsItemsBuilderState();
}

class _NewsItemsBuilderState extends State<NewsItemsBuilder> {
  Future<NewsResponse> newsResponse;

  @override
  void initState() {
    super.initState();
    newsResponse = getRequestedNews(widget.source);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsResponse>(
        future: newsResponse,
        builder: (context, snapShot) {
          if (snapShot.hasData) {
            return ListView.builder(
                itemCount: snapShot?.data?.articles?.length,
                itemBuilder: (context, index) {
                  return NewsItem(snapShot?.data?.articles[index]);
                });
          } else if (snapShot.hasError) {
            return Center(
              child: FloatingActionButton(
                onPressed: () {
                  setState(() {});
                },
                child: Text('Retry'),
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}
