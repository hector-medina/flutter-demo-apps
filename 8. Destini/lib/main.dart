import 'package:flutter/material.dart';
import 'story_brain.dart';

void main() {
  runApp(Destini());
}

class Destini extends StatelessWidget {
  const Destini({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: StoryPage(),
    );
  }
}


class StoryPage extends StatefulWidget {
  const StoryPage({Key? key}) : super(key: key);

  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  StoryBrain storyBrain = StoryBrain();

  bool isVisible = true;

  void buttonPressed(int choice){
    setState(() {
      storyBrain.nextStory(choice);
      isVisible = storyBrain.buttonVisible();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.blue,
          image: DecorationImage(
            image: AssetImage('images/background.png'),
            fit: BoxFit.fill
          )
        ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 70,
              child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      storyBrain.getStory(),
                      style: TextStyle(
                        fontSize: 20.0
                      ),
                    ),
                  ),
              ),
            ),
            Expanded(
              flex: 15,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                    style: ButtonStyle(
                      backgroundColor:MaterialStateProperty.all<Color>(Colors.red.shade600),
                    ),
                    onPressed: (){
                      buttonPressed(1);
                    },
                    child: Text(
                      storyBrain.getChoice1(),
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
              ),
            ),
            Expanded(
              flex: 15,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                  child: Visibility(
                    visible: isVisible,
                    child: TextButton(
                      style: ButtonStyle(
                        backgroundColor:MaterialStateProperty.all<Color>(Colors.blue.shade600),
                      ),
                      onPressed: (){
                        buttonPressed(2);
                      },
                      child: Text(
                        storyBrain.getChoice2(),
                        style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
              ),
            ),
          ],
        ),
      ),
      ),
    );
  }
}
