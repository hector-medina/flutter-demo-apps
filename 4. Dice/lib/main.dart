import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const Dice());
}

class Dice extends StatefulWidget {
  const Dice({Key? key}) : super(key: key);

  @override
  State<Dice> createState() => _DiceState();
}

class _DiceState extends State<Dice> {
  int leftButtonNumber = 1;
  int rightButtonNumber = 1;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red[500],
        appBar: AppBar(
          backgroundColor: Colors.red[800],
          title: Text('Dicee'),
        ),
        body: Center(
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: TextButton(
                    onPressed: (){
                      setState( (){
                        leftButtonNumber = Random().nextInt(6) + 1;
                      });                    },
                    child: Image.asset('images/dice$leftButtonNumber.png'),
                ),
              ),
              Expanded(
                flex: 1,
                child: TextButton(
                  onPressed: (){
                    setState( (){
                      rightButtonNumber = Random().nextInt(6) + 1;
                    });
                  },
                  child: Image.asset('images/dice$rightButtonNumber.png'),
                ),
              ),          ],
          ),
        ),
      ),
    );
  }
}
