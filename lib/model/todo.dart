class Todo {
  String title;
  String description;
  String category;
  bool isDone;
  DateTime? dueDate;

  Todo({
    required this.title,
    required this.description,
    required this.category,
    this.isDone = false,
    this.dueDate,
  });
}
