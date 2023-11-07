import 'package:flutter/cupertino.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Settings Page'),
      ),
      child: Center(
        child: CupertinoButton(
          child: Text('Log Out'),
          onPressed: () {
            showCupertinoDialog(
                context: context,
                builder: (context) {
                  return CupertinoAlertDialog(
                    title: Text('Are you sure to log out?'),
                    actions: [
                      CupertinoDialogAction(
                        child: Text('No'),
                        onPressed: () => Navigator.pop(context),
                      ),
                      CupertinoDialogAction(
                        child: Text('Yes'),
                        onPressed: () => Navigator.pop(context),
                      )
                    ],
                  );
                });
          },
        ),
      ),
    );
  }
}
