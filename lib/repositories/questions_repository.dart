import 'package:quiz_app/models/option.dart';
import 'package:quiz_app/models/question.dart';

class QuestionsRepository {
  static Map<int, Question> question_map = {
    1: Question(
        1,
        [
          Option(1, 'opt a'),
          Option(2, 'opt b'),
          Option(3, 'opt c'),
          Option(4, 'opt d')
        ],
        'question 1'),
    2: Question(
        2,
        [
          Option(5, 'opt a'),
          Option(6, 'opt b'),
          Option(7, 'opt c'),
          Option(8, 'opt d')
        ],
        'question 2'),
    3: Question(
        3,
        [
          Option(9, 'opt a'),
          Option(10, 'opt b'),
          Option(11, 'opt c'),
          Option(12, 'opt d')
        ],
        'question 3'),
    4: Question(
        4,
        [
          Option(13, 'opt a'),
          Option(14, 'opt b'),
          Option(15, 'opt c'),
          Option(16, 'opt d')
        ],
        'question 4'),
  };
  String get_question(int question_id) {
    return question_map[question_id].question_info;
  }

  List<Option> get_options(int question_id, {bool reset = false}) {
    return question_map[question_id].options;
  }

  bool toggle_option_selection(
      int question_id, int option_id, bool current_selected_state) {
    question_map[question_id].options.forEach((option) {
      option.selected = false;
    });
    Option option = question_map[question_id]
        .options
        .firstWhere((opt) => opt.option_id == option_id);
    return option.set_selection_state(!current_selected_state);
  }
}
