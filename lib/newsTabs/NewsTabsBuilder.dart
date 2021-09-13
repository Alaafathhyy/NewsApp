import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/api/ApiServices.dart';
import 'package:untitled/model/SourcesResponse.dart';

import 'AllTabsItems.dart';

class NewsTabsBuilder extends StatefulWidget {
  final String selectedCategory;

  NewsTabsBuilder({@required this.selectedCategory});

  @override
  _NewsTabsBuilderState createState() => _NewsTabsBuilderState();
}

class _NewsTabsBuilderState extends State<NewsTabsBuilder> {
  Future<SourcesResponse> newsSourceResponse;
  @override
  void initState() {
    super.initState();
    newsSourceResponse = getNewsTabs(widget.selectedCategory);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourcesResponse>(
        future: newsSourceResponse,
        builder: (buildContext, snapShot) {
          if (snapShot.hasData) {
            return AllTabsItems(snapShot?.data?.sources);
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
          return Center(child: CircularProgressIndicator());
        });
  }
}
