import 'package:flutter/material.dart';
import 'package:quiz_app/models/option.dart';
import 'package:quiz_app/models/question.dart';
import 'package:quiz_app/repositories/questions_repository.dart';
import 'package:quiz_app/repositories/quiz_repository.dart';
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
                SizedBox(
                  height: 40,
                ),
                _buildItem(context, 'Score', 20),
                SizedBox(
                  height: 20,
                ),
                _buildItem(context, 'Correct Answers', 2),
                SizedBox(
                  height: 20,
                ),
                _buildItem(context, 'Incorrect Answers', 2),
                SizedBox(
                  height: 20,
                ),
                _buildItem(context, 'Total Questions', 4),
                SizedBox(
                  height: 100,
                ),
                RaisedButton(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 12.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    color: Colors.white,
                    elevation: 10,
                    child: Icon(
                      Icons.home,
                      color: Colors.blue,
                      size: 40,
                    ),
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

  Widget _buildItem(BuildContext context, String name, int val) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: ListTile(
        contentPadding: const EdgeInsets.fromLTRB(16, 16, 30, 16),
        title: Text(
          "$name",
          style: TextStyle(
              fontFamily: 'Quicksand',
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
        trailing: Text(
          '$val',
          style: TextStyle(
              color: Colors.red,
              fontFamily: 'Montserrat',
              fontSize: 25,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
