import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/pages/detail_page.dart';
import 'package:news_app/util/articles.dart';
import 'package:news_app/util/widgets/platform_widget.dart';

class ArticleListPage extends StatelessWidget {
  static const routeName = '/article_list';

  const ArticleListPage({super.key});

  Widget _buildArticleItem(BuildContext context, Article article) {
    return Material(
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        leading: Hero(
          tag: article.urlToImage,
          child: Image.network(
            article.urlToImage,
            width: 100,
            errorBuilder: (ctx, error, _) => const Center(
              child: Icon(Icons.error),
            ),
          ),
        ),
        title: Text(article.title),
        subtitle: Text(article.author),
        onTap: () {
          Navigator.pushNamed(context, DetailPage.routeName, arguments: article);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      androidBuilder: _buildAndroid,
      iosBuilder: _buildIos,
    );
  }

  Widget _buildList(BuildContext context) {
    return FutureBuilder<String>(
      future: DefaultAssetBundle.of(context).loadString('assets/articles.json'),
      builder: (context, snapshot) {
        final List<Article> articles = parseArticles(snapshot.data);
        return ListView.builder(
          itemCount: articles.length,
          itemBuilder: (context, index) {
            return _buildArticleItem(context, articles[index]);
          },
        );
      },
    );
  }

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News App'),
      ),
      body: _buildList(context),
    );
  }

  Widget _buildIos(BuildContext context) {
    return CupertinoPageScaffold(
      child: _buildList(context),
      navigationBar: CupertinoNavigationBar(
        middle: const Text('News App'),
      ),
    );
  }
}
