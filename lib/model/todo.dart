class Todo {
  int? id;
  String title;
  String description;
  String category;
  DateTime? dueDate;
  bool isDone;

  Todo({
    this.id,
    required this.title,
    required this.description,
    required this.category,
    this.dueDate,
    this.isDone = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'category': category,
      'duedate': dueDate?.toIso8601String(),
      'isDone': isDone ? 1 : 0,
    };
  }

  factory Todo.fromMap(Map<String, dynamic> map) {
    return Todo(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      category: map['category'],
      dueDate: map['duedate'] != null ? DateTime.parse(map['duedate']) : null,
      isDone: map['isDone'] == 1,
    );
  }
}
