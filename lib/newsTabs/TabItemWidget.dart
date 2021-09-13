import 'package:flutter/material.dart';
import 'package:untitled/model/Source.dart';

class TabItem extends StatelessWidget {
  final Source source;
  final bool selected;

  TabItem(this.source, this.selected);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.00),
      child: Text(
        source.name,
        style: TextStyle(
          color: selected ? Colors.white : Theme.of(context).primaryColor,
          fontSize: 16,
          fontFamily: 'Exo',
        ),
      ),
      decoration: BoxDecoration(
        color: selected ? Theme.of(context).primaryColor : Colors.transparent,
        border: Border.all(width: 1, color: Theme.of(context).primaryColor),
        borderRadius: BorderRadius.all(Radius.circular(25)),
      ),
    );
  }
}
