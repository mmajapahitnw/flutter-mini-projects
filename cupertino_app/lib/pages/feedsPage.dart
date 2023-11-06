import 'package:flutter/cupertino.dart';

class FeedsPage extends StatelessWidget {
  const FeedsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Feeds Page'),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Feeds Page',
              style:
              CupertinoTheme
                  .of(context)
                  .textTheme
                  .navLargeTitleTextStyle,
            ),
            const SizedBox(
              height: 8,
            ),
            CupertinoButton.filled(
              child: Text('Select Category'),
              onPressed: () {
                showCupertinoModalPopup(
                  context: context,
                  builder: (context) {
                    return CupertinoActionSheet(
                      title: Text('Select Categories'),
                      actions: [
                        CupertinoActionSheetAction(
                          onPressed: () {
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => CategoryPage(
                                  selectedCategory:
                                )
                              )
                            )
                          },
                        )
                      ],
                    )
                  },)
              },
            ),
          ],
        ),
      ),
    );
  }
}
