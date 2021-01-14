import 'package:flutter/material.dart';
import 'package:quiz_app/models/option.dart';
import 'package:quiz_app/models/question.dart';
import 'package:quiz_app/repositories/questions_repository.dart';
import 'package:quiz_app/repositories/quiz_repository.dart';
//import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:quiz_app/screens/screen3.dart';
//import 'package:html_unescape/html_unescape.dart';

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

    return Scaffold(
        appBar: AppBar(
          title: Text('Questions'),
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
                  Text(current_question),
                  _buildCard(
                      current_options[0].option_id,
                      current_options[0].option_info,
                      current_options[0].selected,
                      toggle_option),
                  _buildCard(
                      current_options[1].option_id,
                      current_options[1].option_info,
                      current_options[1].selected,
                      toggle_option),
                  _buildCard(
                      current_options[2].option_id,
                      current_options[2].option_info,
                      current_options[2].selected,
                      toggle_option),
                  _buildCard(
                      current_options[3].option_id,
                      current_options[3].option_info,
                      current_options[3].selected,
                      toggle_option),
                  SizedBox(
                    height: 70,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      RaisedButton(
                        onPressed: () {
                          previous_question();
                        },
                        child: Text('previous'),
                      ),
                      RaisedButton(
                        onPressed: () {
                          print('pressed next button');
                          next_question();
                          //print('pressed next button 2nd');
                        },
                        child: Text('next'),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ));
  }

  Widget _buildCard(
      int option_id, String info, bool selected, Function toggle_option) {
    return FlatButton(
      onPressed: () {
        toggle_option(option_id, selected);
      },
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
                margin: EdgeInsets.only(left: 20.0, right: 20),
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                        color: Colors.blue,
                        style: BorderStyle.solid,
                        width: 2)),
              )
            ]),
            // SizedBox(height: 8.0),
            Text(
              '$info',
              style: TextStyle(
                //fontFamily: 'Quicksand',
                fontWeight: FontWeight.bold,
                fontSize: 55,
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
