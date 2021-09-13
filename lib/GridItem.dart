import 'package:flutter/material.dart';

import 'ApiHome.dart';

class Category {
  Color color;
  String image;
  String category;
  String title;

  Category(
    this.color,
    this.image,
    this.category,
    this.title,
  );
}

class CategoryGridItem extends StatelessWidget {
  Category category;
  Function onCategoryItemClick;

  CategoryGridItem(this.category, this.onCategoryItemClick);

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (category.category == 'politics' ||
            category.category == 'Environment') category.category = 'general';

        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => HomeScreen(
                  cat: category.category,
                )));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        height: MediaQuery.of(context).size.height / 6,
        width: MediaQuery.of(context).size.width / 6,
        decoration: BoxDecoration(
          color: category.color,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              category.image,
              height: MediaQuery.of(context).size.height / 6,
            ),
            Text(
              category.title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontFamily: 'Exo',
              ),
            )
          ],
        ),
      ),
    );
  }
}
