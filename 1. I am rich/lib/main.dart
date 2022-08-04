import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey[300],
        appBar: AppBar(
            title: Text('I am rich'),
            backgroundColor: Colors.blueGrey[900],
        ),
        body: Center(
            child: Image.asset('images/diamond.png')
        ),
      ),
    );
  }
}
