import 'package:flutter/material.dart';
import './GridItem.dart';

class HomeCategories extends StatefulWidget {
  Function ItemClick;

  HomeCategories(this.ItemClick);

  @override
  _HomeCategoriesState createState() => _HomeCategoriesState();
}

class _HomeCategoriesState extends State<HomeCategories> {
  List<Category> data = [
    Category(Color.fromRGBO(201, 28, 34, 1.0), 'assets/images/sports.png',
        'sports', ""),
    Category(Color.fromRGBO(0, 62, 144, 1.0), 'assets/images/Politics.png',
        'politics', ""),
    Category(Color.fromRGBO(237, 30, 121, 1.0), 'assets/images/health.png',
        'health', ""),
    Category(Color.fromRGBO(207, 126, 72, 1.0), 'assets/images/bussines.png',
        'business', ""),
    Category(Color.fromRGBO(72, 130, 207, 1.0), 'assets/images/environment.png',
        'Environment', ""),
    Category(Color.fromRGBO(242, 211, 82, 1.0), 'assets/images/science.png',
        'science', "")
  ];

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
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/pattern.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        "",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                          color: Color.fromRGBO(79, 90, 105, 1.0),
                        ),
                      ),
                    ),
                    GridView.builder(
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 12,
                          crossAxisSpacing: 12),
                      itemBuilder: (buildContext, index) => CategoryGridItem(
                          data[index], widget.ItemClick),
                      itemCount: data.length,
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
