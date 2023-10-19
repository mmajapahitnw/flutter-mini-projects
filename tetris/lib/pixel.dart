import 'package:flutter/material.dart';

class Pixel extends StatelessWidget {
  final color;
  final child;

  Pixel({required this.color, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(4),
      ),
      margin: EdgeInsets.all(1),
      child: Center(
          child: Text(
        child,
        style: TextStyle(
          color: Colors.white,
        ),
      )),
    );
  }
}
