import 'package:flutter/material.dart';
import 'package:quiz_app/models/option.dart';
import 'package:quiz_app/models/question.dart';
import 'package:quiz_app/repositories/questions_repository.dart';
import 'package:quiz_app/repositories/quiz_repository.dart';
import 'package:quiz_app/screens/check.dart';
import 'package:quiz_app/screens/screen2.dart';

class ResultPage extends StatefulWidget {
  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  //Map data = {};
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   title: Text('Result'),
        //   elevation: 0,
        // ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Theme.of(context).primaryColor,
            Theme.of(context).accentColor
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(16.0),
                    title: Text("Total Questions"),
                    trailing: Text('4'),
                  ),
                ),
                SizedBox(height: 10.0),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(16.0),
                    title: Text(
                      "Score",
                    ),
                    trailing: Text(
                      "20",
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(16.0),
                    title: Text("Correct Answers"),
                    trailing: Text(
                      "2",
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(16.0),
                    title: Text("Incorrect Answers"),
                    trailing: Text(
                      "2",
                    ),
                  ),
                ),
                SizedBox(height: 30.0),
                RaisedButton(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 20.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    color: Theme.of(context).accentColor.withOpacity(0.7),
                    child: Text("Home"),
                    onPressed: () {
                      Navigator.pushNamed(context, '/home');
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
