import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/todocontroller.dart';
import '../components/customcard.dart';
import '../routes/routes.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final TodoController todoController = Get.find<TodoController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Todo List")),
      body: Obx(() {
        if (todoController.todos.isEmpty) {
          return const Center(child: Text("Belum ada kegiatan"));
        }

        final activeTodos = todoController.todos.where((t) => !t.isDone).toList();


        return ListView.builder(
          itemCount: activeTodos.length,
          itemBuilder: (context, index) {
            final todo =activeTodos[index];
            return CustomCard(
              title: todo.title,
              subtitle: todo.description,
              category: todo.category,
              dueDate: todo.dueDate,
              onDone: () {
                final realIndex = todoController.todos.indexOf(todo);
                todoController.markAsDone(realIndex);
              },
              onEdit: () {
                Get.toNamed(
                  AppRoutes.addtodo,
                  arguments: {
                    "index": index,
                    "title": todo.title,
                    "desc": todo.description,
                    "category": todo.category,
                    "duedate": todo.dueDate,
                  },
                );
              },
              onDelete: () {
                todoController.deleteTodo(index);
              },
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AppRoutes.addtodo);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
