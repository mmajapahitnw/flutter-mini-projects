import 'package:flutter/material.dart';

class PixelPage extends StatelessWidget {
  const PixelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, isScrolled) {
          return [
            SliverAppBar(
              expandedHeight: 200,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                  'assets/pixel_google.jpg',
                  fit: BoxFit.fitWidth,
                ),
                title: const Text('Google Pixel'),
                titlePadding: const EdgeInsets.only(left: 16, bottom: 16),
              ),
            )
          ];
        },
        body: null,

      ),
    );
  }
}
