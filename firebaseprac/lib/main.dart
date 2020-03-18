import 'package:flutter/material.dart';
import 'package:firebaseprac/services/database.dart';

String username = '';
String score = '';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase Practice',
      theme: ThemeData.dark(),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              onChanged: (text) {
                updateUser(text);
              },
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Username',
                contentPadding: EdgeInsets.all(30),
              ),
            ),
            TextField(
              onChanged: (score) {
                updateScore(score);
              },
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Score',
                contentPadding: EdgeInsets.all(30),
              ),
            ),
            FloatingActionButton.extended(
              onPressed: () {
                // send username and score to firebase
                sendData();
              },
              label: Text('Start'),
              icon: Icon(Icons.arrow_forward_ios),
            ),
          ],
        ),
      )
    );
  }
}

updateUser(String _user) {
  username = _user;
  print(username);
}

updateScore(String _score) {
  score = _score;
  print(score);
}

Future sendData() async {
  await DatabaseService(uid: username).updateUserData(username, score);
}