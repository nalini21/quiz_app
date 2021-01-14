import 'package:flutter/material.dart';
import 'package:quiz_app/repositories/quiz_repository.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int quiz_id = 1;
  QuizRepository quizRepository = QuizRepository();
  void setQuiz() {
    setState(() {
      quizRepository.set_current_quiz_id(quiz_id);
    });
  }

  // Map data = {};
  // bool reset = false;
  Widget build(BuildContext context) {
    //data = ModalRoute.of(context).settings.arguments;
    //reset = data['reset'];
    return Scaffold(
        appBar: AppBar(
          title: Text('Quiz App'),
          leading: GestureDetector(
              onTap: () {
                //Navigator.push(context,MaterialPageRoute(builder: (context) => About()));
              },
              child: Icon(Icons.menu)),
          elevation: 0,
        ),
        body: Center(
          child: Stack(
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 70,
                  ),
                  Text(
                    quizRepository.get_quiz(quiz_id).quiz_description,
                    style: TextStyle(fontSize: 25, color: Colors.blue),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    quizRepository.get_quiz(quiz_id).quiz_category,
                    style: TextStyle(fontSize: 25, color: Colors.green),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  RaisedButton(
                    hoverElevation: 40,
                    splashColor: Colors.white,
                    onPressed: () {
                      setQuiz();
                      Navigator.pushReplacementNamed(context, '/quiz',
                          arguments: {
                            'quiz_id': quiz_id,
                            'quiz_repository': quizRepository,
                          });
                    },
                    color: Colors.blue[800],
                    child: Text(
                      'start',
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
