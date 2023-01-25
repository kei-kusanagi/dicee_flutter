// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.purple,
        appBar: AppBar(
          title: const Center(
            child: Text('Dicee'),
          ),
          backgroundColor: Colors.green,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;

  void randomNumber() {
    leftDiceNumber = Random().nextInt(6) + 1;
    rightDiceNumber = Random().nextInt(6) + 1;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      setState(
                        () {
                          leftDiceNumber = Random().nextInt(6) + 1;
                        },
                      );
                    },
                    child: Image.asset('images/dice$leftDiceNumber.png'),
                  ),
                ),
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      setState(
                        () {
                          rightDiceNumber = Random().nextInt(6) + 1;
                        },
                      );
                    },
                    child: Image.asset('images/dice$rightDiceNumber.png'),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      setState(
                        () {
                          // rightDiceNumber = Random().nextInt(6) + 1;
                          randomNumber();
                        },
                      );
                    },
                    child: ListTile(
                      leading: Icon(
                        Icons.change_circle_outlined,
                        color: Colors.cyan.shade400,
                        size: 80.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
