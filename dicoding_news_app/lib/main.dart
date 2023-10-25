import 'package:flutter/material.dart';
import 'package:news_app/pages/detail_page.dart';
import 'package:news_app/pages/news_list_page.dart';
import 'package:news_app/util/articles.dart';
import 'package:news_app/util/webviewWidget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: NewsListPage.routeName,
      routes: {
        NewsListPage.routeName: (context) => const NewsListPage(),
        DetailPage.routeName: (context) => DetailPage(
              article: ModalRoute.of(context)?.settings.arguments as Article,
            ),
        WebView.routeName: (context) => WebView(url: ModalRoute.of(context)?.settings.arguments as String,),
      },
    );
  }
}
