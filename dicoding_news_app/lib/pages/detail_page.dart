import 'package:flutter/material.dart';
import 'package:news_app/util/articles.dart';
import 'package:news_app/util/webviewWidget.dart';

class DetailPage extends StatelessWidget {
  static const routeName = '/article_detail';

  final Article article;

  const DetailPage({
    super.key,
    required this.article,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(article.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(article.urlToImage),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(article.desc),
                  Divider(
                    color: Colors.grey,
                  ),
                  Text(
                    article.title,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  const Divider(
                    color: Colors.grey,
                  ),
                  Text('Date: ${article.publishedAt}'),
                  const SizedBox(
                    height: 10,
                  ),
                  Text('Author ${article.author}'),
                  const Divider(
                    color: Colors.grey,
                  ),
                  Text(
                    article.content,
                    style: const TextStyle(fontSize: 10),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, WebView.routeName, arguments: article.url);
                    },
                    child: const Text('Read More'),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
