import 'option.dart';

class Question {
  final int question_id;
  final String question_info;
  final List<Option> options;
  Question(this.question_id, this.options, this.question_info);
}
