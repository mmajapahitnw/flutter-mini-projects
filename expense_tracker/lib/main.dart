import 'package:flutter/material.dart';
import 'package:gsheets/gsheets.dart';



void main() async{


  // updating a cell
  await sheet!.values.insertValue('MAJA', column: 1, row: 1);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
