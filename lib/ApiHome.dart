import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'HomePage.dart';
import 'model/SourcesResponse.dart';
import 'newsTabs/NewsTabsBuilder.dart';
import './GridItem.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'HomeScreen';
  String cat;

  HomeScreen({@required this.cat});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<SourcesResponse> newsFuture;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News app"),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            ListTile(
              title: Text("Categories"),
              leading: Icon(Icons.home),
              onTap: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeCategories(() {}),
                  ),
                  (Route<dynamic> route) => false,
                );
              },
            )
          ],
        ),
      ),
      body: NewsTabsBuilder(
        selectedCategory: widget.cat,
      ),
    );
  }
}
