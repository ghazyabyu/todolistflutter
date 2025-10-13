import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../model/todo.dart';
import '../db_helper.dart';

class TodoController extends GetxController {
  var todos = <Todo>[].obs;
  final DBHelper db = DBHelper();

  @override
  void onInit() {
    super.onInit();
    loadTodos();
  }

  Future<void> loadTodos() async {
    final data = await db.getAll('todos');
    todos.assignAll(data.map((e) => Todo.fromMap(e)).toList());
  }

  Future<void> addTodo(String title, String desc, String category, DateTime? dueDate) async {
    final todo = Todo(title: title, description: desc, category: category, dueDate: dueDate);
    await db.insert('todos', todo.toMap());
    await loadTodos();
  }

  Future<void> editTodo(int index, String newTitle, String newDesc, String newCategory, DateTime? newDueDate) async {
    final todo = todos[index];
    final updated = Todo(
      id: todo.id,
      title: newTitle,
      description: newDesc,
      category: newCategory,
      dueDate: newDueDate,
      isDone: todo.isDone,
    );
    await db.update('todos', updated.toMap(), todo.id!);
    await loadTodos();
  }

  Future<void> markAsDone(int index) async {
    final todo = todos[index];
    todo.isDone = true;
    await db.update('todos', todo.toMap(), todo.id!);
    await loadTodos();
  }

  Future<void> deleteTodo(int index) async {
    final todo = todos[index];
    await db.delete('todos', todo.id!);
    await loadTodos();
  }

  var isMobile = true.obs;

  void updateLayout(BoxConstraints constraints) {
    isMobile.value = constraints.maxWidth < 600;
  }
}
