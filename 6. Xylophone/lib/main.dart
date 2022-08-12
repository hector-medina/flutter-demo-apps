import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const xylophone());
}

class xylophone extends StatefulWidget {
  const xylophone({Key? key}) : super(key: key);

  @override
  State<xylophone> createState() => _xylophoneState();
}

class _xylophoneState extends State<xylophone> {
  @override
  Widget build(BuildContext context) {
    
    void playSong(int soundNumber){
      final player = AudioPlayer();
      player.play(AssetSource('note$soundNumber.wav'));
    }
    
    Expanded comp({required Color color, required int soundNumber}){
      return  Expanded(
        child: TextButton(
            style:  ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(color),
            ),
            onPressed: (){
              setState(() {
                playSong(soundNumber);
              });
            },
            child: Text('')),
      );
    }
    
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              comp(color: Colors.red, soundNumber: 1),
              comp(color: Colors.orange, soundNumber: 2),
              comp(color: Colors.yellow, soundNumber: 3),
              comp(color: Colors.green, soundNumber: 4),
              comp(color: Colors.teal, soundNumber: 5),
              comp(color: Colors.blue, soundNumber: 6),
              comp(color: Colors.brown, soundNumber: 7),
            ],
          ),
        ),
      ),
    );
  }
}
