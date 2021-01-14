import 'package:flutter/material.dart';
import 'package:quiz_app/screens/loading.dart';
import 'package:quiz_app/screens/screen1.dart';
import 'package:quiz_app/screens/screen2.dart';
import 'package:quiz_app/screens/screen3.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/home',
      routes: {
        '/': (context) => Loading(),
        '/home': (context) => HomePage(),
        '/quiz': (context) => QuizPage(),
        '/result': (context) => ResultPage(),
      },
      //home: HomePage(),
    );
  }
}
