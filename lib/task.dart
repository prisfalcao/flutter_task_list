class Task {
  String name;
  DateTime date;
  bool done;

  Task(String name) {
    this.name = name;
    date = DateTime.now();
    done = false;
  }
}
