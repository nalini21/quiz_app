import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:quiz_app/models/option.dart';
import 'package:quiz_app/repositories/questions_repository.dart';
import 'package:quiz_app/repositories/quiz_repository.dart';
//import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    int quiz_id = data['quiz_id'];
    QuizRepository quizRepository = data['quiz_repository'];
    int current_question_id = quizRepository.current_question_id();
    QuestionsRepository questionsRepository = QuestionsRepository();
    String current_question =
        questionsRepository.get_question(current_question_id);
    List<Option> current_options =
        questionsRepository.get_options(current_question_id);
    int last_question_id = 0;

    void clear_options1() {
      setState(() {
        int flag = 1;
        while (flag == 1) {
          if (quizRepository.get_next_question_id() == -1) {
            flag = 0;
          }
          int current_id = quizRepository.current_question_id();
          List<Option> options = questionsRepository.get_options(current_id);
          for (var i = 0; i < 4; i++) {
            options[i].selected = false;
          }
          quizRepository
              .set_current_question(quizRepository.get_next_question_id());
        }
      });
    }

    void clear_options2() {
      setState(() {
        quizRepository.set_current_question(last_question_id);
        int flag = 1;
        while (flag == 1) {
          if (quizRepository.get_previous_question_id() == -1) {
            flag = 0;
          }
          int current_id = quizRepository.current_question_id();
          List<Option> options = questionsRepository.get_options(current_id);
          for (var i = 0; i < 4; i++) {
            options[i].selected = false;
          }
          quizRepository
              .set_current_question(quizRepository.get_previous_question_id());
        }
      });
    }

    void next_question() {
      setState(() {
        int next_question_id = quizRepository.get_next_question_id();
        if (next_question_id != -1) {
          last_question_id = quizRepository.current_question_id();
          quizRepository.set_current_question(next_question_id);
        } else {
          clear_options2();
          Navigator.pushReplacementNamed(
            context,
            '/result',
          );
        }
      });
    }

    void previous_question() async {
      setState(() {
        int previous_question_id = quizRepository.get_previous_question_id();
        if (previous_question_id != -1)
          quizRepository.set_current_question(previous_question_id);
        else {
          clear_options1();
          Navigator.pushReplacementNamed(context, '/home', arguments: {
            'reset': true,
          });
        }
      });
    }

    void toggle_option(current_option_id, current_selected_state) {
      setState(() {
        questionsRepository.toggle_option_selection(
            current_question_id, current_option_id, current_selected_state);
      });
    }

    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
              leading: Icon(Icons.circle),
              title: Text(
                'Question $current_question_id',
                style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'Quicksand',
                    fontWeight: FontWeight.bold),
              )),
          body: Center(
            child: Stack(
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Text(
                        current_question,
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    _buildCard(
                        'A',
                        current_options[0].option_id,
                        current_options[0].option_info,
                        current_options[0].selected,
                        toggle_option),
                    _buildCard(
                        'B',
                        current_options[1].option_id,
                        current_options[1].option_info,
                        current_options[1].selected,
                        toggle_option),
                    _buildCard(
                        'C',
                        current_options[2].option_id,
                        current_options[2].option_info,
                        current_options[2].selected,
                        toggle_option),
                    _buildCard(
                        'D',
                        current_options[3].option_id,
                        current_options[3].option_info,
                        current_options[3].selected,
                        toggle_option),
                    SizedBox(
                      height: 100,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            //side: BorderSide(color: Colors.white)
                          ),
                          color: Colors.blueAccent,
                          elevation: 10,
                          onPressed: () {
                            previous_question();
                          },
                          child: Text(
                            'prev',
                            style: TextStyle(
                                fontFamily: 'Quicksand',
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            //side: BorderSide(color: Colors.white)
                          ),
                          color: Colors.blueAccent,
                          elevation: 10,
                          onPressed: () {
                            next_question();
                          },
                          child: Text(
                            'next',
                            style: TextStyle(
                                fontFamily: 'Quicksand',
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          )),
    );
  }

  Widget _buildCard(String name, int option_id, String info, bool selected,
      Function toggle_option) {
    return FlatButton(
      onPressed: () {
        toggle_option(option_id, selected);
      },
      child: Container(
        height: 80,
        child: Card(
          color: selected ? Colors.green : Colors.white,
          margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          elevation: 20,
          child: Row(
            children: <Widget>[
              Stack(children: <Widget>[
                Container(
                  child: Text(
                    '$name',
                    style: TextStyle(
                      fontSize: selected ? 12 : 15,
                      color: selected ? Colors.white : Colors.blue,
                    ),
                  ),
                  margin: EdgeInsets.only(left: 20.0, right: 10),
                  padding: EdgeInsets.fromLTRB(7, 4, 5, 5),
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      border: Border.all(
                          color: selected ? Colors.white : Colors.blue,
                          style: BorderStyle.solid,
                          width: selected ? 4 : 3)),
                )
              ]),
              Text(
                '$info',
                style: TextStyle(
                  fontFamily: 'Quicksand',
                  fontSize: 20,
                  //fontFamily: 'Montserrat',
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
