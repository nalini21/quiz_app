import 'package:quiz_app/models/option.dart';
import 'package:quiz_app/models/question.dart';

class QuestionsRepository {
  static Map<int, Question> question_map = {
    1: Question(
        1,
        [
          Option(1, 'Narendra Modi'),
          Option(2, 'Rahul Gandhi'),
          Option(3, 'Manmohan Singh'),
          Option(4, 'Amit Shah')
        ],
        'Who is the current Prime Minister of India?'),
    2: Question(
        2,
        [
          Option(5, 'Mumbai'),
          Option(6, 'Chennai'),
          Option(7, 'New Delhi'),
          Option(8, 'Kolkata')
        ],
        'What is the capital of India?'),
    3: Question(
        3,
        [
          Option(9, 'Mrichhakatika'),
          Option(10, 'Ritusamhara'),
          Option(11, 'Kumarasambhava'),
          Option(12, 'Mudrarakshahsa')
        ],
        'Which among the following Kavya of Sanskrit, deal with court intrigues & access to power of Chandragupta Maurya?'),
    4: Question(
        4,
        [
          Option(13, 'Ashoka'),
          Option(14, 'Chandragupta Maurya'),
          Option(15, 'Kanishka'),
          Option(16, 'Huvishka')
        ],
        'Who was the first Indian ruler who had territory outside India?'),
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
