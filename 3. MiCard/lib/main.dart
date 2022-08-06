import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50.0,
                  backgroundImage: AssetImage('images/profile.jpg'),
                ),
                Text(
                  'Héctor Medina',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Pacifico',
                    fontSize: 40.0,
                  ),
                ),
                Text(
                  'FULLSTACK DEVELOPER & DEVOPS',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontFamily: 'SourceSansPro',
                    letterSpacing: 1.5,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50.0),
                  child: SizedBox(
                    child: Divider(
                      color: Colors.white,
                    ),
                  ),
                ),
                Card(
                  child: ListTile(
                      leading: FaIcon(
                        FontAwesomeIcons.linkedin,
                        color: Colors.teal[900],),
                      title: Text('in/hector-medina-cabanelas')
                  ),
                ),
                Card(
                  child: ListTile(
                      leading: FaIcon(
                        FontAwesomeIcons.github,
                        color: Colors.teal[900],),
                      title: Text('hector-medina')
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
