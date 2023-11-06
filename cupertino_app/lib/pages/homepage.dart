import 'package:cupertino_app/pages/feedsPage.dart';
import 'package:cupertino_app/pages/searchPage.dart';
import 'package:cupertino_app/pages/settingsPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.news),
            label: 'Feeds',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.settings),
            label: 'Settings',
          ),
        ],
      ),
      tabBuilder: (context, index) {
        switch (index) {
          case 0:
            return FeedsPage();
          case 1:
            return SearchPage();
          case 2:
            return SettingsPage();
          default:
            return Center(
              child: Text('Page not found!'),
            );
        }
      },
    );
  }
}
