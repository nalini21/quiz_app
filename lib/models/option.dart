class Option {
  final int option_id;
  final String option_info;
  bool selected = false;
  Option(this.option_id, this.option_info);
  bool set_selection_state(bool selection_state) {
    this.selected = selection_state;
    return true;
  }
}
