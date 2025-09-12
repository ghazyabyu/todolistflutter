import 'package:get/get.dart';
import '../model/todo.dart';

class TodoController extends GetxController {
  var todos = <Todo>[].obs;

  void addTodo(String title, String desc, String category, DateTime? dueDate) {
  todos.add(
    Todo(
      title: title,
      description: desc,
      category: category,
      dueDate: dueDate,
    ),
  );
}


  void markAsDone(int index) {
    todos[index].isDone = true;
    todos.refresh();
  }

  void editTodo(
    int index,
    String newTitle,
    String newDesc,
    String newCategory,
    DateTime? newdueDate,

  ) {
    todos[index].title = newTitle;
    todos[index].description = newDesc;
    todos[index].category = newCategory;
    todos[index].dueDate = newdueDate;
    todos.refresh();
  }

  void deleteTodo(int index) {
    todos.removeAt(index);
  }
  
}
