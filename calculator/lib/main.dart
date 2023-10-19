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
  var userQuestion = '';
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

  // button action chooser
  Function buttonAction(int index) {
    if (index == 0) {
      return () {
        setState(() {
          userQuestion = '';
        });
      };
    } else if (index == 1) {
      return () {
        setState(() {
          userQuestion = userQuestion.substring(0, userQuestion.length - 1);
        });
      };
    }

    else {
      return () {
        setState(() {
          userQuestion += buttons[index];
        });
      };
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
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        userQuestion,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        userAnswer,
                        style: TextStyle(
                          fontSize: 40,
                        ),
                      ),
                    ),
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
                      // button C
                      if (index == 0) {
                        return MyButton(buttonText: buttons[index],
                          color: Colors.green,
                          textColor: Colors.white,
                          buttonTapped: () {
                          setState(() {
                            userQuestion = '';
                          });
                          },
                        );
                      }

                      // button del
                      else if (index == 1) {
                        return MyButton(buttonText: buttons[index],
                          color: Colors.red,
                          textColor: Colors.white,
                          buttonTapped: () {
                            setState(() {
                              userQuestion = userQuestion.substring(0, userQuestion.length-1);
                            });
                          },
                        );
                      }

                      // the operators
                      else if (buttons[index] == '%' || buttons[index] == '/' || buttons[index] == 'x' || buttons[index] == '-' || buttons[index] == '+'){
                        return MyButton(buttonText: buttons[index],
                          color: Colors.deepPurple,
                          textColor: Colors.white,
                          buttonTapped: () {
                            setState(() {
                              userQuestion += buttons[index];
                            });
                          },
                        );
                      }

                      // equal sign
                      else if (buttons[index] == '=') {
                        return MyButton(buttonText: buttons[index],
                          color: Colors.black54,
                          textColor: Colors.white,
                          buttonTapped: () {
                            setState(() {
                              userQuestion += buttons[index];
                            });
                          },
                        );
                      }

                      // the rest
                      else {
                        return MyButton(buttonText: buttons[index],
                          color: Colors.white,
                          textColor: Colors.deepPurple,
                          buttonTapped: () {
                            setState(() {
                              userQuestion += buttons[index];
                            });
                          },
                        );
                      }
                    }),
              ))
        ],
      ),
    );
  }
}
