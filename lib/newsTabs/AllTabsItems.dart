import 'package:flutter/material.dart';
import 'package:untitled/model/Source.dart';

import '../newsArticles/NewsItemsBuilder.dart';
import 'TabItemWidget.dart';

class AllTabsItems extends StatefulWidget {
  final List<Source> sources;

  AllTabsItems(this.sources);

  @override
  _AllTabsItemsState createState() => _AllTabsItemsState();
}

class _AllTabsItemsState extends State<AllTabsItems> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.sources.length,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TabBar(
                onTap: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                indicatorColor: Colors.transparent,
                isScrollable: true,
                tabs: widget.sources
                    .map((source) => TabItem(
                        source, widget.sources.indexOf(source) == currentIndex)).toList()),
          ),
          Expanded(
            child: TabBarView(
              children:
                  widget.sources.map((source) => NewsItemsBuilder(source: source)).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
