import 'package:calculator/buttons.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var userQuestion = 'question';
  var userAnswer = 'answer';

  List<String> buttons = [
    'C',
    'DEL',
    '%',
    '/',
    '9',
    '8',
    '7',
    'x',
    '6',
    '5',
    '4',
    '-',
    '3',
    '2',
    '1',
    '+',
    '0',
    '.',
    'ANS',
    '='
  ];

  // button color picker
  Color buttonColor(String text) {
    if (text == 'C') {
      return Colors.green;
    } else if (text == 'DEL') {
      return Colors.red;
    } else if (text != '%' &&
        text != '/' &&
        text != 'x' &&
        text != '-' &&
        text != '+' &&
        text != '=') {
      return Colors.white;
    } else {
      return Colors.deepPurple;
    }
  }

  // text color chooser
  Color textColor(int index) {
    if (index > 3 && index != 7 && index != 11 && index != 15 && index != 19) {
      return Colors.deepPurple;
    } else {
      return Colors.white;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(userQuestion),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    child: Text(userAnswer),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
              flex: 2,
              child: Container(
                child: GridView.builder(
                    itemCount: buttons.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4),
                    itemBuilder: (BuildContext context, int index) {
                      return MyButton(
                        color: buttonColor(buttons[index]),
                        textColor: textColor(index),
                        buttonText: buttons[index],
                      );
                    }),
              ))
        ],
      ),
    );
  }
}
