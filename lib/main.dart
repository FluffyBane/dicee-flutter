import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  final imageList = [
    'images/dice1.png',
    'images/dice2.png',
    'images/dice3.png',
    'images/dice4.png',
    'images/dice5.png',
    'images/dice6.png'
  ];

  int leftDiceNumber = 1;
  int rightDiceNumber = 2;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Die(
                imagePath: 'images/dice$leftDiceNumber.png',
                onPressed: handleButtonPressed,
              ),
              Die(
                imagePath: 'images/dice$rightDiceNumber.png',
                onPressed: handleButtonPressed,
              ),
            ],
          ),
        ),
      ],
    );
  }

  handleButtonPressed() {
    setState(() {
      leftDiceNumber = randomDiceNumber();
      rightDiceNumber = randomDiceNumber();
    });
  }

  int randomDiceNumber() => Random().nextInt(6 - 1) + 1;
}

class Die extends StatelessWidget {
  final String imagePath;
  final Function onPressed;

  Die({this.imagePath, Key key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FlatButton(
        onPressed: onPressed,
        child: Image.asset(imagePath),
      ),
    );
  }
}
