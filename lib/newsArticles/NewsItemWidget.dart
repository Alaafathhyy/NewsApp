import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:untitled/model/Article.dart';

import 'package:url_launcher/url_launcher.dart';

class NewsItem extends StatelessWidget {
  final Article article;

  NewsItem(this.article);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _launchURL(article.url);
      },
      child: Container(
        padding: EdgeInsets.all(8.00),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.00),
              child: CachedNetworkImage(
                imageUrl: article.urlToImage,
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
                height: 240,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
            Text(
              article.author,
              style: TextStyle(fontWeight: FontWeight.w300),
              textAlign: TextAlign.start,
            ),
            Text(
              article.title,
              style: TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.start,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              article.publishedAt,
              style: TextStyle(fontWeight: FontWeight.w300),
              textAlign: TextAlign.end,
            ),
          ],
        ),
      ),
    );
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
