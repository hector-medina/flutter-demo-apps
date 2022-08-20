import 'package:flutter/material.dart';
import 'Quiz.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(const QuizzApp());
}


class QuizzApp extends StatelessWidget {
  const QuizzApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
            child: Quizzler(),
        ),
      ),
    );
  }
}



class Quizzler extends StatefulWidget {
  const Quizzler({Key? key}) : super(key: key);

  @override
  State<Quizzler> createState() => _QuizzlerState();
}

class _QuizzlerState extends State<Quizzler> {

  Quiz quizer = Quiz();

  List<Icon> scoreKeeper = [];

  void questionEval(bool answer, BuildContext context){
    setState(() {
      if(quizer.isFinished()){
        Alert(context: context, title: "Finished!", desc: "You have finished the quiz.").show();
        quizer.reset();
        scoreKeeper = [];
      }
      else {
        if(quizer.getQuestionAnswer() == answer) scoreKeeper.add( Icon(Icons.check, color: Colors.green, size: 20.0));
        else scoreKeeper.add(Icon(Icons.close, color: Colors.red, size: 20.0,));
        quizer.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 10,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        quizer.getQuestionText(),
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
              ),
              Expanded(
                flex: 2 ,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                    onPressed: (){
                      questionEval(true, context);
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.green.shade700),
                    ),
                    child: Text(
                      'True',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              Expanded(
                  flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                    onPressed: (){
                      questionEval(false, context);
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                    ),
                    child: Text(
                      'False',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: scoreKeeper,
                  ),
                ),
              ),
            ],
          );
  }
}
