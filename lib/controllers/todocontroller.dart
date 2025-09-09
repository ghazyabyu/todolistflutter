import 'package:get/get.dart';
import '../model/todo.dart';

class TodoController extends GetxController {
  var todos = <Todo>[].obs;

  void addTodo(String title, String description, String category) {
    todos.add(Todo(title: title, description: description, category: category));
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
  ) {
    todos[index].title = newTitle;
    todos[index].description = newDesc;
    todos[index].category = newCategory;
    todos.refresh();
  }

  void deleteTodo(int index) {
    todos.removeAt(index);
  }
}
