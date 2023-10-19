import 'package:flutter/material.dart';
import 'package:tetris/pixel.dart';

class GameBoard extends StatefulWidget {
  const GameBoard({super.key});

  @override
  State<GameBoard> createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {
  // grid dimension
  int rowLength = 10;
  int colLength = 15;

  //

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      // create grid of pixels
      body: GridView.builder(
        itemCount: rowLength * colLength,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: rowLength),
        itemBuilder: (context, index) {
          return Pixel(color: Colors.grey[900], child: index.toString(),);
        }
      ),
    );
  }
}
