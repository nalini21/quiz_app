import 'package:flutter/material.dart';
import 'package:quiz_app/repositories/quiz_repository.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

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

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          //backgroundColor: Colors.blue[900],
          appBar: AppBar(
            title: Text(
              'Quiz App',
              style: TextStyle(
                  fontSize: 24,
                  fontFamily: 'Quicksand',
                  fontWeight: FontWeight.bold),
            ),
            backgroundColor: Colors.blue,
            leading: GestureDetector(
                onTap: () {
                  //Navigator.push(context,MaterialPageRoute(builder: (context) => About()));
                },
                child: Icon(Icons.menu)),
            elevation: 0,
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10),
                  height: 500,
                  //margin: EdgeInsetsGeometry.infinity,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(20, 0, 10, 0),
                        height: 400,
                        width: 370,
                        child: Card(
                          color: Colors.blue,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            child: Center(
                              child: Text(
                                quizRepository
                                    .get_quiz(quiz_id)
                                    .quiz_description,
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontFamily: 'Quicksand'),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 0, 20, 0),
                        height: 400,
                        width: 370,
                        child: Card(
                          color: Colors.blue,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            child: Center(
                              child: Text(
                                quizRepository.get_quiz(quiz_id).quiz_category,
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontFamily: 'Quicksand'),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                RaisedButton(
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  elevation: 5,
                  onPressed: () {
                    setQuiz();
                    Navigator.pushReplacementNamed(context, '/quiz',
                        arguments: {
                          'quiz_id': quiz_id,
                          'quiz_repository': quizRepository,
                        });
                  },
                  child: Text(
                    'Start',
                    style: TextStyle(
                        fontFamily: 'Quicksand',
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
