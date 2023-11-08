import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:news_app/common/styles.dart';
import 'package:news_app/ui/article_list_page.dart';
import 'package:news_app/ui/settings_page.dart';
import 'package:news_app/widgets/platform_widget.dart';
import 'dart:io' show Platform;

class HomePage extends StatefulWidget {
  static const routeName = '/home_page';

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<BottomNavigationBarItem> _bottomNavBarItems = [
    BottomNavigationBarItem(
      icon: Icon(Platform.isIOS ? CupertinoIcons.news : Icons.public),
      label: 'Headline',
    ),
    BottomNavigationBarItem(
      icon: Icon(Platform.isIOS ? CupertinoIcons.settings : Icons.settings),
      label: 'Settings',
    ),
  ];

  final List<Widget> _listWidget = [
    ArticleListPage(),
    SettingsPage(),
  ];

  int _bottomNavIndex = 0;

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      androidBuilder: _buildAndroid, iosBuilder: _buildIos,);
  }

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      body: _bottomNavIndex == 0 ? ArticleListPage() : SettingsPage(),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: secondaryColor,
        currentIndex: _bottomNavIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.public), label: 'Headline',),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.settings), label: 'Settings'),
        ],
        onTap: (selected) {
          setState(() {
            _bottomNavIndex = selected;
          });
        },
      ),
    );
  }

  Widget _buildIos(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        activeColor: secondaryColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.news), label: 'Headline',),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.settings), label: 'Settings',),
        ],
      ),
      tabBuilder: (context, index) {
        switch (index) {
          case 1:
            return SettingsPage();
          default:
            return ArticleListPage();
        }
      },
    );
  }
}
