import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'HomePage.dart';

void main() {
  runApp(MaterialApp(
      theme: ThemeData(
        primaryColor: Color.fromRGBO(57, 165, 82, 1.0),
      ),
      debugShowCheckedModeBanner: false,
      home: HomeCategories(() {})));
}
