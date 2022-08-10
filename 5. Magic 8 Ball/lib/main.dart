import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const magicball());
}

class magicball extends StatefulWidget {
  const magicball({Key? key}) : super(key: key);

  @override
  State<magicball> createState() => _magicballState();
}

class _magicballState extends State<magicball> {
  int ball_number = 1;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          title: Text('Ask me anything'),
        ),
        body: Center(
          child: Row(
            children: [
              Expanded(
                child: TextButton(
                    onPressed: (){
                      setState(() {
                        ball_number = Random().nextInt(5)+1;
                      });
                    },
                    child: Image.asset('images/ball$ball_number.png')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
